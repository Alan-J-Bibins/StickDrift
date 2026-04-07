import QtQuick

Rectangle {
    id: toolSelectContainer
    implicitWidth: toolSelectRow.width
    implicitHeight: toolSelectRow.height
    color: Theme.background_2
    border.width: 1
    border.color: Theme.text

    Row {
        id: toolSelectRow
        padding: 8
        spacing: 12

        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Select.svg"
            toolType: EditorTool.Select
        }
        ToolSelectItem {
            iconSource: "qrc:/assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Scale.svg"
            toolType: EditorTool.Scale
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Frame.svg"
            toolType: EditorTool.Frame
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Canvas.svg"
            toolType: EditorTool.Canvas
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Polygon.svg"
            toolType: EditorTool.Polygon
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Ellipse.svg"
            toolType: EditorTool.Ellipse
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Section.svg"
            toolType: EditorTool.Section
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Pencil.svg"
            toolType: EditorTool.Pencil
        }
    }
}
