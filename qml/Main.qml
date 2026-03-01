import QtQuick

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {
        Button {
            content: "something"
        }
        Button {
            content: "testing a very very long string"
        }
    }

}
