import QtQuick

Rectangle {
    id: projectControl
    color: Theme.background_2

    property int minWidth: 200
    property int maxWidth: 600

    width: projectControl.minWidth


    Rectangle {
        anchors.right: parent.right
        width: 1
        height: parent.height
        color: Theme.text
        opacity: 0.2
    }

    MouseArea {
        id: resizer
        width: 8
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        cursorShape: Qt.SizeHorCursor

        drag.target: resizer_proxy
        drag.axis: Drag.XAxis

        Item { id: resizer_proxy }

        onPositionChanged: (mouse) => {
            if (pressed) {
                let newWidth = mapToItem(projectControl, mouse.x, 0).x

                if (newWidth >= projectControl.minWidth && newWidth <= projectControl.maxWidth) {
                    projectControl.width = newWidth
                }
            }
        }
    }

    Column {
        anchors.fill: parent
        padding: 12
        spacing: 12

        TitleText{
            textLabel.text: "Untitled"
            textLabel.font.pixelSize: 24
            textLabel.font.weight: 500
            textLabel.color: Theme.text
        }

        Rectangle {
            height: 1
            color: Theme.text
            opacity: 0.2
            anchors.left: parent.left
            width: parent.width
        }
    }

}
