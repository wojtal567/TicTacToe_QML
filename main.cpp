#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <player.h>
#include <players.h>
#include <QQmlContext>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    Player *ex = new Player('X');
    Player *circle = new Player('O');
    Players *_players = new Players(ex, circle);
    engine.rootContext()->setContextProperty("players", _players);

    engine.load(url);

    return app.exec();
}
