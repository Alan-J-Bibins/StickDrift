import QtQuick

Rectangle {
    id: toolSelectContainer
    implicitWidth: toolSelectRow.width
    implicitHeight: toolSelectRow.height
    color: Theme.background_2
    border.width: 1
    border.color: mouse.hovered ? Theme.text : Qt.alpha(Theme.text, 0.2)

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
    }

    Behavior on border.color {
        ColorAnimation {
            duration: 100
        }
    }

    Row {
        id: toolSelectRow
        padding: 8
        spacing: 12

        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Select.svg"
            toolType: WorkspaceTool.Select
        }
        ToolSelectItem {
            iconSource: "qrc:/assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Scale.svg"
            toolType: WorkspaceTool.Scale
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Frame.svg"
            toolType: WorkspaceTool.Frame
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Canvas.svg"
            toolType: WorkspaceTool.Canvas
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Polygon.svg"
            toolType: WorkspaceTool.Polygon
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Ellipse.svg"
            toolType: WorkspaceTool.Ellipse
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Section.svg"
            toolType: WorkspaceTool.Section
        }
        ToolSelectItem {
            iconSource: "qrc:assets/icons/ToolSelectItemIcon/ToolSelectItemIcon-Pencil.svg"
            toolType: WorkspaceTool.Pencil
        }
    }
}
