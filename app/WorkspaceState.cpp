#include "WorkspaceState.h"
#include <QQuickItem>

WorkspaceState *WorkspaceState::instance() {
    static WorkspaceState *res = new WorkspaceState();
    return res;
}

void WorkspaceState::setWorkspaceBackgroundColor(const QColor &color) {
    if (m_workspaceBackgroundColor != color) {
        m_workspaceBackgroundColor = color;
        emit workspaceBackgroundColorChanged();
    }
}

void WorkspaceState::setZoom(float targetZoom, const QPointF &pivot) {
    if (qFuzzyCompare(m_zoom, targetZoom) || targetZoom < 0.01f)
        return;

    QPointF worldBefore = mapToWorld(pivot);

    m_zoom = targetZoom;
    setPan(pivot - (worldBefore * m_zoom));

    emit zoomChanged();
}

void WorkspaceState::setPan(QPointF pan) {
    if (m_pan == pan)
        return;

    m_pan = pan;
    emit panChanged();
}
QPointF WorkspaceState::pan() const { return m_pan; }
float WorkspaceState::zoom() const { return m_zoom; }
SceneGraph *WorkspaceState::graph() const { return m_graph; }

void WorkspaceState::setCurrentTool(StickDrift::ToolType tool) {
    if (m_currentTool == tool)
        return;
    m_currentTool = tool;
    emit currentToolChanged();
}

QPointF WorkspaceState::mapToWorld(QPointF screenPos) { return (screenPos - m_pan) / m_zoom; }

void WorkspaceState::createRectangle(int x, int y, int width, int height) {
    QPointF worldPos = mapToWorld(QPointF(x, y));
    float worldWidth = width / m_zoom;
    float worldHeight = height / m_zoom;
    auto rect = new RectangleNode(static_cast<int>(worldPos.x()), static_cast<int>(worldPos.y()), static_cast<int>(worldWidth), static_cast<int>(worldHeight));
    m_graph->root()->children.append(rect);
    emit graphChanged();
}
