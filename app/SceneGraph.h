#ifndef SCENEGRAPH_H
#define SCENEGRAPH_H

#include "SceneNode.h"
#include <QObject>
class SceneGraph : public QObject {
    Q_OBJECT

  private:
    SceneNode *m_root;

  public:
    explicit SceneGraph(QObject *parent = nullptr) : QObject(parent) { m_root = new SceneNode(); }
    ~SceneGraph() { delete m_root; }
    SceneNode *root() const;
};

#endif // !DEBUG
