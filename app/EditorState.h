#ifndef EDITORSTATE_H
#define EDITORSTATE_H

#include "Constants.h"
#include <QObject>
#include <QtQml/qqmlregistration.h>

class QQmlEngine;
class QJSEngine;

class EditorState : public QObject {
    Q_OBJECT
    Q_PROPERTY(StickDrift::ToolType currentTool READ currentTool WRITE setCurrentTool NOTIFY currentToolChanged)
    QML_ELEMENT
    QML_SINGLETON

public:
    static EditorState* instance();

    static EditorState* create(QQmlEngine *qmlEngine, QJSEngine *jsEngine) {
        Q_UNUSED(qmlEngine)
        Q_UNUSED(jsEngine)
        return instance(); 
    }

    StickDrift::ToolType currentTool() const { return m_currentTool; }

public slots:
    void setCurrentTool(StickDrift::ToolType tool)
    {
        if (m_currentTool == tool)
            return;
        m_currentTool = tool;
        emit currentToolChanged();
    }

signals:
    void currentToolChanged();

private:
    explicit EditorState(QObject* parent = nullptr)
        : QObject(parent)
    {
        m_currentTool = StickDrift::ToolType::Select;
    }

    StickDrift::ToolType m_currentTool;
};

#endif
