#ifndef GAME_H
#define GAME_H

#include <player.h>
#include <QString>
#include <QVector2D>
class Game : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Player* currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer)
    Q_PROPERTY(Player* exPlayer READ getExPlayer)
    Q_PROPERTY(Player* circlePlayer READ getCirclePlayer)
    Q_PROPERTY(Player* winner READ getWinner)
public:
    Game(Player* x, Player* o);

    Q_INVOKABLE void updateBoard(QString text, int index);
    Q_INVOKABLE bool checkWinner();
    Player* getExPlayer();
    Player* getCirclePlayer();
    Player* getCurrentPlayer();
    Player* getWinner();
    void setExPlayer(Player* newPlayer);
    void setCirclePlayer(Player* newPlayer);
    void setCurrentPlayer(Player* newPlayer);

private:
    Player *currentPlayer;
    Player *ex;
    Player *circle;
    Player *winner;
    QVector<QString> board;
    int count;
};

#endif // GAME_H
