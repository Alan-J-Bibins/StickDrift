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
        zoom: 1.0
    }

    ProjectControl {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    ToolSelect {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 24
    }
}
