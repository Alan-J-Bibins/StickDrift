#ifndef WORKSPACEENGINE_H
#define WORKSPACEENGINE_H

#include "WorkspaceState.h"
#include <QQuickItem>
#include <QSGNode>

class WorkspaceEngine : public QQuickItem {
    Q_OBJECT
    Q_PROPERTY(WorkspaceState *state READ state WRITE setState NOTIFY stateChanged)
    QML_ELEMENT

  public:
    WorkspaceEngine(QQuickItem *parent) : QQuickItem(parent), m_state(nullptr) {
        // Important: Custom QQuickItems that use updatePaintNode
        // MUST set this flag, or the engine will never call it.
        setFlag(ItemHasContents);

        // Enable mouse/wheel events for this item
        setAcceptedMouseButtons(Qt::LeftButton | Qt::RightButton);
        setState(WorkspaceState::instance());
    }
    WorkspaceState *state() const;
    void setState(WorkspaceState *state);

  protected:
    QSGNode *updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *) override;
    void wheelEvent(QWheelEvent *event) override;
    void mousePressEvent(QMouseEvent *event) override;

  signals:
    void stateChanged();

  private:
    WorkspaceState *m_state = nullptr;
    void syncNodes(SceneNode *logicalNode, QSGNode *renderParent);
};

#endif
