import QtQuick
import QtQuick.Shapes
import QtQuick.Layouts

Item {
    id: welcomeScreen
    anchors.fill: parent
    signal newProjectRequested()

    Shape {
        id: backgroundShape
        anchors.fill: parent

        layer.enabled: true
        layer.samples: 4

        ShapePath {
            strokeWidth: -1
            strokeColor: "transparent"

            // Fill the entire area
            fillGradient: RadialGradient {
                centerX: welcomeScreen.width / 2 
                centerY: welcomeScreen.height / 2
                centerRadius: welcomeScreen.width
                focalX: centerX; focalY: centerY
                GradientStop { position: 0; color: "#171717" }
                GradientStop { position: 1; color: "#242424" }
            }

            // Define the rectangle path that the gradient fills
            startX: 0; startY: 0
            PathLine { x: welcomeScreen.width; y: 0 }
            PathLine { x: welcomeScreen.width; y: welcomeScreen.height }
            PathLine { x: 0; y: welcomeScreen.height }
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
            width: welcomeScreen.width - (2 * parent.padding)
            TitleText {
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                textLabel.text: "Projects"
                textLabel.font.pixelSize: 48
                textLabel.color: Theme.text
                textLabel.font.weight: 400
            }
            Row {
                spacing: 12
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                PrimaryButton {
                    id: openProjectButton
                    label: "Open Project"
                }
                PrimaryButton {
                    id: newProjectButton
                    label: "New Project"
                    onClicked: {
                        welcomeScreen.newProjectRequested()
                    }
                }
            }
        }
    }

}
