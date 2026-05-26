#ifndef WORKSPACESTATE_H
#define WORKSPACESTATE_H

#include "Constants.h"
#include "SceneGraph.h"
#include <QColor>
#include <QObject>
#include <QPoint>
#include <QtQml/qqmlregistration.h>

class QQmlEngine;
class QJSEngine;

class WorkspaceState : public QObject {
    Q_OBJECT
    Q_PROPERTY(StickDrift::ToolType currentTool READ currentTool WRITE setCurrentTool NOTIFY currentToolChanged)
    Q_PROPERTY(QColor workspaceBackgroundColor READ workspaceBackgroundColor WRITE setWorkspaceBackgroundColor NOTIFY workspaceBackgroundColorChanged)
    Q_PROPERTY(QPointF pan READ pan WRITE setPan NOTIFY panChanged)
    QML_ELEMENT
    QML_SINGLETON

  public:
    static WorkspaceState *instance();

    static WorkspaceState *create(QQmlEngine *qmlEngine, QJSEngine *jsEngine) {
        Q_UNUSED(qmlEngine)
        Q_UNUSED(jsEngine)
        return instance();
    }

    explicit WorkspaceState(QObject *parent = nullptr) : QObject(parent), m_workspaceBackgroundColor(QColor("#171717")), m_zoom(1.0f), m_pan(0, 0) {
        m_currentTool = StickDrift::ToolType::Select;
        m_graph = new SceneGraph(this);
    }

    StickDrift::ToolType currentTool() const { return m_currentTool; }

    QColor workspaceBackgroundColor() const { return m_workspaceBackgroundColor; }
    void setWorkspaceBackgroundColor(const QColor &color);
    float zoom() const;
    void setZoom(float targetZoom, const QPointF &pivot);
    QPointF pan() const;
    void setPan(QPointF pan);
    SceneGraph *graph() const;

  public slots:
    void setCurrentTool(StickDrift::ToolType tool);
    void createRectangle(int x, int y, int width, int height);
  signals:
    void currentToolChanged();
    void workspaceBackgroundColorChanged();
    void zoomChanged();
    void panChanged();
    void graphChanged();

  private:
    StickDrift::ToolType m_currentTool;
    QColor m_workspaceBackgroundColor;
    float m_zoom;
    QPointF m_pan;
    SceneGraph *m_graph;
    QPointF mapToWorld(QPointF screenPos);
};

#endif
