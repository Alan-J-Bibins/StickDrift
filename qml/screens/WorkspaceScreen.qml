import QtQuick

Item {
    id: workspaceScreen

    Rectangle {
        anchors.fill: parent
        color: Theme.background_1
    }

    Row {
        padding: 24

        ToolSelect {}
    }
}
