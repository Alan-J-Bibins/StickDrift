#include "WorkspaceState.h"

WorkspaceState* WorkspaceState::instance()
{
    static WorkspaceState* res = new WorkspaceState();
    return res;
}

void WorkspaceState::setWorkspaceBackgroundColor(const QColor &color) {
    if(m_workspaceBackgroundColor != color) {
        m_workspaceBackgroundColor = color;
        emit workspaceBackgroundColorChanged();
    }
}
