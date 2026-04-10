import QtQuick
import QtQuick.Layouts

Rectangle {
    id: attributeControl
    color: Theme.background_2

    property int minWidth: 240
    property int maxWidth: 600

    width: attributeControl.minWidth

    Rectangle {
        anchors.left: parent.left
        width: 1
        height: parent.height
        color: Theme.text
        opacity: 0.2
    }

    MouseArea {
        id: resizer
        width: 8
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        cursorShape: Qt.SizeHorCursor

        drag.target: resizer_proxy
        drag.axis: Drag.XAxis

        Item { id: resizer_proxy }

        onPositionChanged: (mouse) => {
            if (pressed) {
                let deltaX = mouse.x 
                let newWidth = attributeControl.width - deltaX

                if (newWidth >= attributeControl.minWidth && newWidth <= attributeControl.maxWidth) {
                    attributeControl.width = newWidth
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        Label {
            label: "Workspace Background"
            Layout.fillWidth: true
        }

        ColorInput {
            Layout.fillWidth: true
            defaultColor: WorkspaceState.workspaceBackgroundColor
            onColorAccepted: (newColor) => {
                WorkspaceState.workspaceBackgroundColor = newColor
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

}
