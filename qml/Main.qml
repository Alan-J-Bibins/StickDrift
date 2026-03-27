import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts

Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Stick Drift")

    Shape {
        id: backgroundShape
        anchors.fill: parent

        // This removes the default black border from the shape
        layer.enabled: true
        layer.samples: 4 // Smooths the edges

        ShapePath {
            strokeWidth: -1 // No border
            strokeColor: "transparent"

            // Fill the entire area
            fillGradient: RadialGradient {
                centerX: root.width / 2 
                centerY: root.height / 2
                centerRadius: root.width
                focalX: centerX; focalY: centerY
                GradientStop { position: 0; color: "#171717" }
                GradientStop { position: 1; color: "#242424" }
            }

            // Define the rectangle path that the gradient fills
            startX: 0; startY: 0
            PathLine { x: root.width; y: 0 }
            PathLine { x: root.width; y: root.height }
            PathLine { x: 0; y: root.height }
            PathLine { x: 0; y: 0 }
        }
    }

    Column {
        padding: 24
        anchors.fill: parent

        TitleText {
            textLabel.text: "Welcome Back!"
            textLabel.font.pixelSize: 56
            textLabel.color: Theme.text
            textLabel.font.weight: 600
        }

        RowLayout {
            width: root.width - (2 * parent.padding)
            TitleText {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                textLabel.text: "Projects"
                textLabel.font.pixelSize: 48
                textLabel.color: Theme.text
                textLabel.font.weight: 400
            }
            Row {
                anchors.right: parent.right
                spacing: 12
                anchors.verticalCenter: parent.verticalCenter
                Button {
                    id: openProjectsButton
                    root.color: mouse.hovered ? Theme.text: "transparent";
                    BaseText {
                        textLabel.text: "Open Project"
                        textLabel.font.pixelSize: 20
                        textLabel.color: openProjectsButton.mouse.hovered ? Theme.background_2 : Theme.text
                        textLabel.font.weight: 400
                        Behavior on color {
                            ColorAnimation {
                                duration: 150
                                easing.type: Easing.InCubic
                            }
                        }
                    }
                }
                Button {
                    id: newProjectsButton
                    root.color: mouse.hovered ? Theme.text: "transparent";
                    BaseText {
                        textLabel.text: "New Project"
                        textLabel.font.pixelSize: 20
                        textLabel.color: newProjectsButton.mouse.hovered ? Theme.background_2 : Theme.text
                        textLabel.font.weight: 400
                        Behavior on color {
                            ColorAnimation {
                                duration: 150
                                easing.type: Easing.InCubic
                            }
                        }
                    }
                }
            }
        }
    }
}
