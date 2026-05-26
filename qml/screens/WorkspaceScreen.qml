import QtQuick

Item {
    id: workspaceScreen
    implicitWidth: 1920 
    implicitHeight: 1080

    Rectangle {
        anchors.fill: parent
        color: Theme.background_1
    }

    WorkspaceEngine {
        id: engine
        anchors.fill: parent
        state: WorkspaceState
        TapHandler {
            onTapped: workspaceScreen.forceActiveFocus()
        }
        onStateChanged: {
            console.log("Pan tool is online")
        }
    }

    SelectTool {
        anchors.fill: parent
        enabled: WorkspaceState.currentTool === WorkspaceTool.Select
    }

    RectangleTool {
        anchors.fill: parent
        enabled: WorkspaceState.currentTool === WorkspaceTool.Polygon
    }

    ProjectControl {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        TapHandler {
            onTapped: workspaceScreen.forceActiveFocus()
        }
    }

    AttributeControl {
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        TapHandler {
            onTapped: workspaceScreen.forceActiveFocus()
        }
    }

    ToolSelect {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 24
    }
}
