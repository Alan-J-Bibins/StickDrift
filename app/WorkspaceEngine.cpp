#include "WorkspaceEngine.h"
#include "WorkspaceState.h"
#include <QQuickItem>
#include <QSGNode>
#include <QSGSimpleRectNode>

WorkspaceEngine::WorkspaceEngine(QQuickItem *parent) : QQuickItem(parent), m_state(nullptr) {
    // Important: Custom QQuickItems that use updatePaintNode
    // MUST set this flag, or the engine will never call it.
    setFlag(ItemHasContents);

    // Enable mouse/wheel events for this item
    setAcceptedMouseButtons(Qt::LeftButton | Qt::RightButton);
    setState(WorkspaceState::instance());
}
WorkspaceState *WorkspaceEngine::state() const { return m_state; };

void WorkspaceEngine::mousePressEvent(QMouseEvent *event) {
    // We'll handle panning/selection logic here later
    qDebug() << "Mouse pressed at:" << event->position() << "with zoom:" << m_state->zoom();

    // It handles Qt types like magic:
    qDebug() << "Current BG Color:" << m_state->workspaceBackgroundColor();
    event->accept();
}

void WorkspaceEngine::wheelEvent(QWheelEvent *event) {
    if (!m_state)
        return;
    float delta = event->angleDelta().y() > 0 ? 1.5f : 0.5f;
    qDebug() << "Current BG Color:" << m_state->workspaceBackgroundColor();
    qDebug() << "Current delta" << delta;
    m_state->setZoom(m_state->zoom() * delta);
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
    }

    emit stateChanged();
    update();
}

QSGNode *WorkspaceEngine::updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *) {

    if (!m_state || !m_state->graph() || !m_state->graph()->root()) {
        return oldNode;
    }

    QSGNode *root = oldNode ? oldNode : new QSGNode();

    // 1. Viewport Transform (Zoom/Pan)
    QSGTransformNode *viewport = nullptr;
    if (root->childCount() == 0) {
        viewport = new QSGTransformNode();
        root->appendChildNode(viewport);
    } else {
        viewport = static_cast<QSGTransformNode *>(root->firstChild());
    }

    QMatrix4x4 matrix;
    matrix.scale(m_state->zoom());
    matrix.translate(m_state->pan().x(), m_state->pan().y());
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
