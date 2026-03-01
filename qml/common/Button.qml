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

        TitleText {
            textLabel.text: buttonRoot.content.toString()
            textLabel.font.pixelSize: 24
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
