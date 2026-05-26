#ifndef INPUTHANDLER_H
#define INPUTHANDLER_H

#include <QKeyEvent>
#include <QObject>
class InputHandler : public QObject {
    Q_OBJECT
  public:
    InputHandler() : m_isPanToolActive(false) {}
    void processKeyPress(QKeyEvent *event);
    void processKeyRelease(QKeyEvent *event);
    void processMouseDrag(QMouseEvent *event, const QPointF &delta);
    bool isPanToolActive() const;
  signals:
    void panToolToggled(bool active);
    void requestPan(const QPointF &delta);
    // void requestInteraction(const QPointF &pos, const QPointF &delta);
  private:
    bool m_isPanToolActive;
};

#endif // !DEBUG
