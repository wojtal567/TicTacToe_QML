#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <player.h>
#include <game.h>
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
    Game *_game = new Game(ex, circle);
    _game->setBoardSize(4);
    engine.rootContext()->setContextProperty("game", _game);

    engine.load(url);

    return app.exec();
}
