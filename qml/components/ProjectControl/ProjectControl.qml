import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

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

        RowLayout {
            spacing: 8
            width: parent.width - (parent.padding * 2)
            TitleText{
                textLabel.text: "Untitled"
                textLabel.font.pixelSize: 24
                textLabel.font.weight: 500
                textLabel.color: Theme.text
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            Button {
                id: projectMenuTrigger
                padding: 4
                onClicked: {
                    projectMenu.popup()
                }

                background: Rectangle {
                    border.width: 1
                    border.color: projectMenuTrigger.hovered ? Qt.alpha(Theme.text, 0.2) : "transparent"
                    color: projectMenuTrigger.hovered ? Qt.alpha(Theme.text, 0.1) : "transparent"

                    Behavior on color {
                        ColorAnimation {
                            duration: 100
                        }
                    }

                    Behavior on border.color {
                        ColorAnimation {
                            duration: 100
                        }
                    }
                }

                contentItem: Image {
                    smooth: true
                    anchors.centerIn: parent
                    source: "qrc:/assets/icons/ProjectControl/more_vert.svg"
                    fillMode: Image.PreserveAspectFit
                    sourceSize.height: 24
                    sourceSize.width: 24

                }

                Menu {
                    id: projectMenu
                    y: projectMenuTrigger.height + (projectMenuTrigger.padding * 2)
                    x: projectMenuTrigger.width + (projectMenuTrigger.padding * 2)
                    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                    popupType: Popup.Item
                    MenuItem {
                        BaseText {
                            textLabel.text: "Save"
                        }
                    }
                }
            }
        }


        Rectangle {
            height: 1
            color: Theme.text
            opacity: 0.2
            anchors.left: parent.left
            width: parent.width
        }

        PagesPanel {}

        Rectangle {
            height: 1
            color: Theme.text
            opacity: 0.2
            anchors.left: parent.left
            width: parent.width
        }

        LayersPanel {}
    }

}
