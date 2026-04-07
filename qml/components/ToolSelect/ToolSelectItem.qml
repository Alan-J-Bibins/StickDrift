import QtQuick
import QtQuick.Controls

Button {
    id: toolSelectItem
    hoverEnabled: true
    padding: 8

    property url iconSource: ""

    background: Rectangle {
        anchors.fill: parent
        color: toolSelectItem.hovered ? Qt.alpha(Theme.text, 0.1) : Qt.alpha(Theme.text, 0.0)
        border.color: toolSelectItem.hovered ? Qt.alpha(Theme.text,0.2) : Qt.alpha(Theme.text,0.0);
        border.width: 2
        radius: 0

        Behavior on color {
            ColorAnimation {
                duration: 100
                easing.type: Easing.Linear
            }
        }

        Behavior on border.color {
            ColorAnimation {
                duration: 100
                easing.type: Easing.Linear
            }
        }
    }

    contentItem: Image {
        smooth: true
        anchors.centerIn: parent
        source: toolSelectItem.iconSource
        fillMode: Image.PreserveAspectFit
    }
}
