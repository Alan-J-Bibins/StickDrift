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

void WorkspaceState::setZoom(float z) {
    if (qFuzzyCompare(m_zoom, z))
        return;
    m_zoom = z;
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
