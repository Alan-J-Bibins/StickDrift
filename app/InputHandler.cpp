#include "InputHandler.h"

bool InputHandler::isPanToolActive() const { return m_isPanToolActive; }

void InputHandler::processKeyPress(QKeyEvent *event) {
    if (event->key() == Qt::Key_Space && !event->isAutoRepeat()) {
        m_isPanToolActive = true;
        emit panToolToggled(true);
        event->accept();
    }
}

void InputHandler::processMouseDrag(QMouseEvent *event, const QPointF &delta) {
    if (m_isPanToolActive) {
        emit requestPan(delta);
    }
}

void InputHandler::processKeyRelease(QKeyEvent *event) {
    if (event->key() == Qt::Key_Space && !event->isAutoRepeat()) {
        m_isPanToolActive = false;
        emit panToolToggled(false);
        event->accept();
    }
}
