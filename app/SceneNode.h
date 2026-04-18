#ifndef SCENENODE_H
#define SCENENODE_H

#include <QColor>
#include <QList>
#include <QMatrix4x4>

enum class SceneNodeType {
    Base,
    Rectangle,
    Frame,
    Canvas,
    Text,
};

class SceneNode {
  public:
    SceneNode() : isDirty(true), x(0), y(0) {}
    SceneNode(int x, int y) : isDirty(true), x(x), y(y) {}

    virtual ~SceneNode() { qDeleteAll(children); }

    virtual SceneNodeType type() const { return SceneNodeType::Base; }

    void markDirty();

    QMatrix4x4 localTransform;
    QList<SceneNode *> children;
    bool isDirty;
    int x;
    int y;
};

class RectangleNode : public SceneNode {
  public:
    RectangleNode() : SceneNode(), m_width(100), m_height(100), m_color(QColor("#FFFFFF")) {}
    RectangleNode(int width, int height) : SceneNode(), m_width(width), m_height(height), m_color(QColor("#FFFFFF")) {}
    RectangleNode(int x, int y, int width, int height) : SceneNode(x, y), m_width(width), m_height(height), m_color(QColor("#FFFFFF")) {}
    SceneNodeType type() const override { return SceneNodeType::Rectangle; }

    void setColor(const QColor *color);
    void setWidth(const int *width);
    void setHeight(const int *height);
    int width() const;
    int height() const;
    QColor color() const;

  private:
    QColor m_color;
    int m_width;
    int m_height;
};

#endif // !DEBUG
