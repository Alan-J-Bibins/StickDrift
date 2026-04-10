import QtQuick

TitleText{
    required property string label
    textLabel.text: label.toUpperCase()
    textLabel.font.pixelSize: 12
    textLabel.font.letterSpacing: 2
    textLabel.font.weight: 500
    textLabel.color: Theme.text
}
