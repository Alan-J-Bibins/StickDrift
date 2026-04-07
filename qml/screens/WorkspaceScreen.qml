import QtQuick

Item {
    id: workspaceScreen

    Rectangle {
        anchors.fill: parent
        color: Theme.background_1
    }

    ToolSelect {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 24
    }
}
