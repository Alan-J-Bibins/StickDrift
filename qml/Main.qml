import QtQuick

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column {
        Button {
            BaseText {
                textLabel.text: "hlloe"
            }
        }
        Button{
            childrenContainer.padding: 32
            color: mouse.hovered ? "red" : "blue"

            TitleText{
                textLabel.text: "WTF"
                textLabel.font.pixelSize: 24
            }
        }
    }
}
