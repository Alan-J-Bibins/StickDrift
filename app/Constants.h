#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

namespace StickDrift {
Q_NAMESPACE
QML_ELEMENT
QML_NAMED_ELEMENT(EditorTool)

enum class ToolType {
    Select,
    Scale,
    Frame,
    Canvas,
    Polygon,
    Ellipse,
    Section,
    Pencil,
};
Q_ENUM_NS(ToolType)
}

#endif // CONSTANTS_H
