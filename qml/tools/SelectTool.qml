import QtQuick

Item {
    id: selectTool
    required property bool enabled

    property point startPoint: Qt.point(0, 0)
    property point currentPoint: Qt.point(0, 0)
    property bool isSelecting: false

    DragHandler {
        id: dragHandler
        target: null
        enabled: selectTool.enabled
        onActiveChanged: {
            if(active) {
                selectTool.startPoint = dragHandler.centroid.pressPosition
                selectTool.isSelecting = true
            } else {
                selectTool.isSelecting = false
            }
        }

        onCentroidChanged: {
            selectTool.currentPoint = dragHandler.centroid.position
        }
    }

    Rectangle {
        id: selectionRect
        visible: selectTool.enabled && selectTool.isSelecting
        x: Math.min(selectTool.startPoint.x, selectTool.currentPoint.x)
        y: Math.min(selectTool.startPoint.y, selectTool.currentPoint.y)
        width: Math.abs(selectTool.currentPoint.x - selectTool.startPoint.x)
        height: Math.abs(selectTool.currentPoint.y - selectTool.startPoint.y)
        border.width: 1
        border.color: Theme.primary_1
        color: Qt.alpha(Theme.primary_1, 0.2)
    }
}
