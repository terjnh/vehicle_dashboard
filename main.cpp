#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "backend.h"
#include "timer.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // Register QML Types
    qmlRegisterType<Backend>("com.company.backend", 1, 0, "Backend");
    qmlRegisterType<Timer>("com.company.timer", 1, 0, "Timer");


    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
