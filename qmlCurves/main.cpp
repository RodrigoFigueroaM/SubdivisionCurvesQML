#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include "chaikinscurve.h"
#include "beziercurve.h"
#include "controller.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    QScopedPointer<Controller> controller(new Controller);
    engine.rootContext()->setContextProperty("applicationPath", "file://"+qApp->applicationDirPath()+ "/");
    engine.rootContext()->setContextProperty("controller", controller.data());


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
