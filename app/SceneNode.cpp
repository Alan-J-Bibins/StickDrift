#include "SceneNode.h"

void SceneNode::markDirty() { isDirty = true; }

void RectangleNode::setColor(const QColor *color) {
    if (m_color != *color) {
        m_color = *color;
        markDirty();
    }
}

void RectangleNode::setWidth(const int *width) {
    if (m_width != *width) {
        m_width = *width;
        markDirty();
    }
}

void RectangleNode::setHeight(const int *height) {
    if (m_height != *height) {
        m_height = *height;
        markDirty();
    }
}

int RectangleNode::width() const { return m_width; }
int RectangleNode::height() const { return m_height; }
QColor RectangleNode::color() const { return m_color; }

QColor BackgroundNode::color() const { return m_color; }
void BackgroundNode::setColor(const QColor &color) {
    if (m_color != color) {
        m_color = color;
        markDirty();
    }
}
