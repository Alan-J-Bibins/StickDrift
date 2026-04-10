import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Button {
    id: colorInput
    required property color defaultColor
    signal colorAccepted(color newColor)
    padding: 8

    function validateAndCommit() {
        let input = textField.text.trim().replace("#", "")

        if (input.length > 0 && input.length < 3) {
            input = input.repeat(input.length === 1 ? 6 : 3)
        }

        let hexPattern = /^([A-Fa-f0-9]{3}){1,2}$/

        if (hexPattern.test(input)) {
            let finalHex = "#" + input
            let validatedColor = Qt.color(finalHex)

            if (!isNaN(validatedColor.r)) {
                colorInput.colorAccepted(validatedColor)

                textField.text = validatedColor.toString().toUpperCase().slice(1, 7)
            }
        } else {
            textField.text = colorInput.defaultColor.toString().toUpperCase().slice(1, 7)
        }

        textField.deselect()
        colorInput.forceActiveFocus()
    }

    onClicked: {
        textField.forceActiveFocus()
    }

    background: Rectangle {
        color: colorInput.hovered || textField.activeFocus ?  Qt.alpha(Theme.text, 0.2) : Qt.alpha(Theme.text, 0.1)
        border.width:1
        border.color: textField.activeFocus ? Theme.primary_1 : colorInput.hovered ?  Qt.alpha(Theme.text, 0.3) : Qt.alpha(Theme.text, 0.2)

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

    contentItem: RowLayout {
        id: row
        spacing: 8
        anchors.leftMargin: 8
        anchors.rightMargin: 8

        Rectangle {
            implicitWidth: 16
            implicitHeight: 16
            color: colorInput.defaultColor
            border.width: 1
            border.color: Theme.primary_1
        }

        TextField {
            id: textField
            font.family: Theme.baseFontFamily
            font.pixelSize: 16
            Layout.fillWidth: true
            color: Theme.text
            text: colorInput.defaultColor.toString().slice(1).toUpperCase()
            background: null
            selectByMouse: true
            selectionColor: Theme.primary_1

            Behavior on selectionColor {
                ColorAnimation {
                    duration: 100
                }
            }

            Keys.onEscapePressed: {
                colorInput.forceActiveFocus()
            }

            onActiveFocusChanged: {
                if (activeFocus) {
                    selectAll()
                } else {
                    colorInput.validateAndCommit()
                }
            } 

            onAccepted: {
                colorInput.validateAndCommit()
            }
        }

    }
}
