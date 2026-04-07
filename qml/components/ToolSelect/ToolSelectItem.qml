import QtQuick
import QtQuick.Controls

Button {
    id: toolSelectItem
    hoverEnabled: true
    padding: 8

    property url iconSource: ""
    required property int toolType

    onClicked: {
        if(WorkspaceState.currentTool !== toolSelectItem.toolType) {
            console.log("Setting to ", toolType);
            WorkspaceState.currentTool = toolSelectItem.toolType
        }
    }

    background: Rectangle {
        anchors.fill: parent
        color: WorkspaceState.currentTool === toolSelectItem.toolType ? Qt.alpha(Theme.text, 0.1) : toolSelectItem.hovered ? Qt.alpha(Theme.text, 0.1) : Qt.alpha(Theme.text, 0.0)
        border.color: WorkspaceState.currentTool === toolSelectItem.toolType ? Qt.alpha(Theme.text, 0.2) :  toolSelectItem.hovered ? Qt.alpha(Theme.text,0.2) : Qt.alpha(Theme.text,0.0)
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
