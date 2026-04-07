#include "WorkspaceState.h"

WorkspaceState* WorkspaceState::instance()
{
    static WorkspaceState* res = new WorkspaceState();
    return res;
}
