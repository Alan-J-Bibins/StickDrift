import QtQuick
import QtQuick.Controls

Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Stick Drift")

    StackView {
        id: mainNav
        anchors.fill: parent
        initialItem: WelcomeScreen {
            onNewProjectRequested: {
                console.log("Navigating...");
                mainNav.push("screens/WorkspaceScreen.qml");
            }
        }
    }
}
