import QtQuick

Item {
    id: rectangleTool
    required property bool enabled

    property point startPoint: Qt.point(0, 0)
    property point currentPoint: Qt.point(0, 0)
    property bool isDrawing: false

    DragHandler {
        id: dragHandler
        target: null
        enabled: rectangleTool.enabled
        cursorShape: Qt.CrossCursor
        onActiveChanged: {
            if(active) {
                rectangleTool.startPoint = dragHandler.centroid.pressPosition
                rectangleTool.isDrawing = true
            } else {
                rectangleTool.isDrawing = false

                let finalX = Math.min(rectangleTool.startPoint.x, rectangleTool.currentPoint.x)
                let finalY = Math.min(rectangleTool.startPoint.y, rectangleTool.currentPoint.y)
                let finalW = Math.abs(rectangleTool.currentPoint.x - rectangleTool.startPoint.x)
                let finalH = Math.abs(rectangleTool.currentPoint.y - rectangleTool.startPoint.y)

                // Only add if it's not a tiny accidental click
                if (finalW > 2 && finalH > 2) {
                    WorkspaceState.createRectangle(finalX, finalY, finalW, finalH)
                }
            }
        }

        onCentroidChanged: {
            rectangleTool.currentPoint = dragHandler.centroid.position
        }
    }

    Rectangle {
        id: selectionRect
        visible: rectangleTool.enabled && rectangleTool.isDrawing
        x: Math.min(rectangleTool.startPoint.x, rectangleTool.currentPoint.x)
        y: Math.min(rectangleTool.startPoint.y, rectangleTool.currentPoint.y)
        width: Math.abs(rectangleTool.currentPoint.x - rectangleTool.startPoint.x)
        height: Math.abs(rectangleTool.currentPoint.y - rectangleTool.startPoint.y)
        border.width: 1
        border.color: Theme.primary_1
        color: Qt.alpha(Theme.primary_1, 0.2)
    }
}
