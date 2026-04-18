#ifndef WORKSPACEENGINE_H
#define WORKSPACEENGINE_H

#include "WorkspaceState.h"
#include <QQuickItem>
#include <QSGNode>

class WorkspaceEngine : public QQuickItem {
    Q_OBJECT
    Q_PROPERTY(WorkspaceState *state READ state WRITE setState NOTIFY stateChanged())
    QML_ELEMENT

  public:
    WorkspaceEngine(QQuickItem *parent = nullptr);
    WorkspaceState *state() const;
    void setState(WorkspaceState *state);

  protected:
    QSGNode *updatePaintNode(QSGNode *oldNode, UpdatePaintNodeData *) override;
    void wheelEvent(QWheelEvent *event) override;
    void mousePressEvent(QMouseEvent *event) override;

  signals:
    void workspaceBackgroundColorChanged();
    void stateChanged();

  private:
    WorkspaceState *m_state;
    void syncNodes(SceneNode *logicalNode, QSGNode *renderParent);
};

#endif
