#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include "chaikinscurve.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    QScopedPointer<ChaikinsCurve> spline(new ChaikinsCurve);
     engine.rootContext()->setContextProperty("spline", spline.data());

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
