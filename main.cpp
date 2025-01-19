#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QQmlContext>

#include "app/ThemeManager.h"
using namespace  Qt::StringLiterals;

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QGuiApplication::setOrganizationName("k1tbyte");
    QGuiApplication::setApplicationName("QML Components demo");

    QQmlApplicationEngine engine;

    auto* themeManager = new ThemeManager(&app);
    engine.rootContext()->setContextProperty("themeManager", themeManager);

    const QString executableName = QFileInfo(QCoreApplication::applicationFilePath()).baseName();
    const QString qmlPath = QString("qrc:/qt/qml/%1/ui/view/Main.qml").arg(executableName);
    engine.load(QUrl(qmlPath));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}