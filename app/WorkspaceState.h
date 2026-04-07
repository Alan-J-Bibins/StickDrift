#ifndef WORKSPACESTATE_H
#define WORKSPACESTATE_H

#include "Constants.h"
#include <QObject>
#include <QtQml/qqmlregistration.h>

class QQmlEngine;
class QJSEngine;

class WorkspaceState : public QObject {
    Q_OBJECT
    Q_PROPERTY(StickDrift::ToolType currentTool READ currentTool WRITE setCurrentTool NOTIFY currentToolChanged)
    QML_ELEMENT
    QML_SINGLETON

public:
    static WorkspaceState* instance();

    static WorkspaceState* create(QQmlEngine *qmlEngine, QJSEngine *jsEngine) {
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
    explicit WorkspaceState(QObject* parent = nullptr)
        : QObject(parent)
    {
        m_currentTool = StickDrift::ToolType::Select;
    }

    StickDrift::ToolType m_currentTool;
};

#endif
