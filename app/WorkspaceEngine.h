#ifndef WORKSPACEENGINE_H
#define WORKSPACEENGINE_H

#include <QQuickItem>
#include <QSGNode>

class WorkspaceEngine : public QQuickItem {
    Q_OBJECT
    Q_PROPERTY(float zoom READ zoom WRITE setZoom NOTIFY zoomChanged)
    Q_PROPERTY(QColor workspaceBackgroundColor READ workspaceBackgroundColor WRITE setWorkspaceBackgroundColor NOTIFY workspaceBackgroundColorChanged)
    QML_ELEMENT

public:
    WorkspaceEngine(QQuickItem* parent = nullptr);
    float zoom() const { return m_zoom; }
    void setZoom(float z);
    QColor workspaceBackgroundColor() const {return m_workspaceBackgroundColor;}
    void setWorkspaceBackgroundColor(const QColor &color);

protected:
    QSGNode* updatePaintNode(QSGNode* oldNode, UpdatePaintNodeData*) override;
    void wheelEvent(QWheelEvent* event) override;
    void mousePressEvent(QMouseEvent* event) override;

signals:
    void zoomChanged();
    void workspaceBackgroundColorChanged();

private:
    float m_zoom = 1.0f;
    QPointF m_panOffset;
    QColor m_workspaceBackgroundColor;
};

#endif
