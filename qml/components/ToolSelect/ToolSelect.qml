import QtQuick

Rectangle {
    id: toolSelectContainer
    implicitWidth: toolSelectRow.width
    implicitHeight: toolSelectRow.height
    color: Theme.background_2

    Row {
        id: toolSelectRow
        padding: 8
        spacing: 12

        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Select.svg"
        }
        ToolSelectItem {
            iconSource: "qrc:/assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Scale.svg"
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Frame.svg"
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Canvas.svg"
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Polygon.svg"
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Ellipse.svg"
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Section.svg"
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Pencil.svg"
        }
    }
}
