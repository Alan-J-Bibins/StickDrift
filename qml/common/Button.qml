import QtQuick

Rectangle {
    id: buttonRoot
    color: mouseHandler.hovered ? "#1d1d1d": "transparent";
    border.width: 1
    border.color: Theme.text

    implicitWidth: layoutColumn.implicitWidth
    implicitHeight: layoutColumn.implicitHeight

    property alias root: buttonRoot
    property alias mouse: mouseHandler

    property alias childrenContainer: layoutColumn
    default property alias children: layoutColumn.data

    Column {
        id: layoutColumn
        padding: 12.0
        spacing: 2
    }

    HoverHandler {
        id: mouseHandler
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }

    Behavior on color {
        ColorAnimation {
            duration: 150
            easing.type: Easing.InCubic
        }
    }
}
