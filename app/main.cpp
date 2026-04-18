#include "WorkspaceState.h"
#include <QDebug>
#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed, &app, []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.loadFromModule("StickDrift", "Main");

    // Iterate through qresources to check if things got imported properly
    // QDirIterator it(":", QDirIterator::Subdirectories);
    // while (it.hasNext()) {
    //     qDebug() << it.next();
    // }
    //
    // main.cpp

    auto state = WorkspaceState::instance();
    auto rect = new RectangleNode(200, 150);
    rect->x = 100;
    rect->y = 100;
    rect->setColor(new QColor("red")); // Using your current pointer setter
    state->graph()->root()->children.append(rect);
    return app.exec();
}
