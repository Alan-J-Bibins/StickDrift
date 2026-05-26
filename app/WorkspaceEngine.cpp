#include "WorkspaceEngine.h"
#include "InputHandler.h"
#include "WorkspaceState.h"
#include <QQuickItem>
#include <QSGNode>
#include <QSGSimpleRectNode>

WorkspaceState *WorkspaceEngine::state() const { return m_state; };

void WorkspaceEngine::mousePressEvent(QMouseEvent *event) {
    // We'll handle panning/selection logic here later
    qDebug() << "Mouse pressed at:" << event->position() << "with zoom:" << m_state->zoom();
    m_lastMousePos = event->position();
    event->accept();
}

void WorkspaceEngine::mouseReleaseEvent(QMouseEvent *event) {
    qDebug() << "Mouse released at:" << event->position() << "with zoom:" << m_state->zoom();

    if(!m_inputHandler->isPanToolActive()) {
        m_inputHandler->processMouseDrag(event, event->position() - m_lastMousePos);
    }
    event->accept();
}

void WorkspaceEngine::mouseMoveEvent(QMouseEvent *event) {
    if (m_inputHandler->isPanToolActive()) {
        QPointF delta = event->position() - m_lastMousePos;
        m_inputHandler->processMouseDrag(event, delta);
        m_lastMousePos = event->position();
    }
}

void WorkspaceEngine::keyPressEvent(QKeyEvent *event) {
    m_inputHandler->processKeyPress(event);
    if (!event->isAccepted())
        QQuickItem::keyPressEvent(event);
}
void WorkspaceEngine::keyReleaseEvent(QKeyEvent *event) {
    m_inputHandler->processKeyRelease(event);
    if (!event->isAccepted())
        QQuickItem::keyReleaseEvent(event);
}

void WorkspaceEngine::wheelEvent(QWheelEvent *event) {
    if (!m_state)
        return;

    float scaleFactor = event->angleDelta().y() > 0 ? 1.1f : 0.9f;
    float targetZoom = m_state->zoom() * scaleFactor;

    // To zoom to screen center:
    QPointF pivot(width() / 2.0, height() / 2.0);

    // OR To zoom to mouse position (much better feel):
    // QPointF pivot = event->position();

    m_state->setZoom(targetZoom, pivot);
    event->accept();
}

void WorkspaceEngine::setState(WorkspaceState *state) {
    if (m_state == state)
        return;

    if (m_state)
        m_state->disconnect(this);

    m_state = state;
    if (m_state) {
        connect(m_state, &WorkspaceState::zoomChanged, this, &QQuickItem::update);
        connect(m_state, &WorkspaceState::panChanged, this, &QQuickItem::update);
        connect(m_state, &WorkspaceState::workspaceBackgroundColorChanged, this, &QQuickItem::update);
        connect(m_state, &WorkspaceState::graphChanged, this, &QQuickItem::update);
        connect(m_inputHandler, &InputHandler::requestPan, this, [this](const QPointF &delta) { m_state->setPan(m_state->pan() + delta); });

        connect(m_inputHandler, &InputHandler::panToolToggled, this, [this](bool active) { setCursor(active ? Qt::OpenHandCursor : Qt::ArrowCursor); });
    }

    emit stateChanged();
    update();
}

QSGNode *WorkspaceEngine::updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *) {

    if (!m_state || !m_state->graph() || !m_state->graph()->root()) {
        return oldNode;
    }

    QSGNode *root = oldNode ? oldNode : new QSGNode();

    QSGSimpleRectNode *background = nullptr;
    if (root->childCount() == 0) {
        background = new QSGSimpleRectNode();
        root->appendChildNode(background);
    } else {
        background = static_cast<QSGSimpleRectNode *>(root->firstChild());
    }

    background->setRect(0, 0, width(), height());
    background->setColor(m_state->workspaceBackgroundColor());

    // 1. Viewport Transform (Zoom/Pan)
    QSGTransformNode *viewport = nullptr;
    if (root->childCount() == 1) {
        viewport = new QSGTransformNode();
        root->appendChildNode(viewport);
    } else {
        viewport = static_cast<QSGTransformNode *>(root->childAtIndex(1));
    }

    QMatrix4x4 matrix;
    matrix.translate(m_state->pan().x(), m_state->pan().y());
    matrix.scale(m_state->zoom());
    viewport->setMatrix(matrix);

    // 2. Simple Sync (Clear and Rebuild)
    // We'll optimize this with isDirty later; for now, let's just see it work.
    while (viewport->childCount() > 0) {
        delete viewport->childAtIndex(0);
    }

    if (m_state->graph() && m_state->graph()->root()) {
        syncNodes(m_state->graph()->root(), viewport);
    }

    return root;
}

void WorkspaceEngine::syncNodes(SceneNode *logicalNode, QSGNode *renderParent) {
    for (SceneNode *child : logicalNode->children) {

        if (!child)
            continue;

        if (child->type() == SceneNodeType::Rectangle) {
            RectangleNode *rect = static_cast<RectangleNode *>(child);

            QSGSimpleRectNode *hwNode = new QSGSimpleRectNode();
            hwNode->setRect(rect->x, rect->y, rect->width(), rect->height());
            hwNode->setColor(rect->color());

            renderParent->appendChildNode(hwNode);
        }

        // Recurse for groups/frames
        if (!child->children.isEmpty()) {
            syncNodes(child, renderParent);
        }
    }
}
