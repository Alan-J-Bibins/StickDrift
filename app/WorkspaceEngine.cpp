#include "WorkspaceEngine.h"
#include <QSGNode>
#include <QQuickItem>

WorkspaceEngine::WorkspaceEngine(QQuickItem *parent)
    : QQuickItem(parent)
{
    // Important: Custom QQuickItems that use updatePaintNode 
    // MUST set this flag, or the engine will never call it.
    setFlag(ItemHasContents);
    
    // Enable mouse/wheel events for this item
    setAcceptedMouseButtons(Qt::LeftButton | Qt::RightButton);
}

void WorkspaceEngine::setZoom(float z) {
    if (qFuzzyCompare(m_zoom, z))
        return;
    m_zoom = z;
    emit zoomChanged();
    update(); // Tells Qt to re-run updatePaintNode
}

void WorkspaceEngine::mousePressEvent(QMouseEvent *event) {
    // We'll handle panning/selection logic here later
    event->accept();
}

void WorkspaceEngine::wheelEvent(QWheelEvent *event) {
    // Simple zoom logic
    float delta = event->angleDelta().y() > 0 ? 1.1f : 0.9f;
    setZoom(m_zoom * delta);
    event->accept();
}

QSGNode *WorkspaceEngine::updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *) {
    // For now, return the oldNode (or nullptr) to stop the linker complaining
    return oldNode;
}
