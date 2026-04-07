import QtQuick

Item {
    id: workspaceScreen

    Rectangle {
        anchors.fill: parent
        color: Theme.background_1
    }

    ProjectControl {
        anchors.left: parent.left
        height: parent.height
    }

    ToolSelect {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 24
    }
}
