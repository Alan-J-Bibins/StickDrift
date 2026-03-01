import QtQuick

Rectangle {
    id: buttonRoot
    color: mouse.hovered ? "#0e081d": "blue";
    property string content: ""
    width: layoutColumn.width
    height: layoutColumn.height

    Column {
        id: layoutColumn
        padding: 12.0
        spacing: 2

        Text {
            text: buttonRoot.content.toString()
            font.family: "Satoshi"
            font.pixelSize: 64
        }
    }

    HoverHandler {
        id: mouse
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
