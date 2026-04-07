import QtQuick
import QtQuick.Controls

Button {
    id: primaryButton
    hoverEnabled: true
    padding: 12
    property string label: "Click Me"

    background: Rectangle {
        anchors.fill: parent
        color: primaryButton.hovered ? Theme.text : Theme.background_2
        border.color: Theme.text
        radius: 0
        Behavior on color {
            ColorAnimation {
                duration: 150
                easing.type: Easing.Linear
            }
        }
    }

    contentItem: BaseText {
        textLabel.text: primaryButton.label
        textLabel.font.pixelSize: 20
        textLabel.color: primaryButton.hovered ? Theme.background_2 : Theme.text
        textLabel.font.weight: 400
        Behavior on color {
            ColorAnimation {
                duration: 150
                easing.type: Easing.Linear
            }
        }
    }
}
