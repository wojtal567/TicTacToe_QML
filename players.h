#ifndef PLAYERS_H
#define PLAYERS_H

#include <player.h>
#include <QString>
#include <QVector2D>
class Players : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Player* currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer)
    Q_PROPERTY(Player* exPlayer READ getExPlayer)
    Q_PROPERTY(Player* circlePlayer READ getCirclePlayer)
public:
    Players(Player* x, Player* o);

    Q_INVOKABLE void updateBoard(QString text, int index);
    void checkWinner();
    Player* getExPlayer();
    Player* getCirclePlayer();
    Player* getCurrentPlayer();

    void setExPlayer(Player* newPlayer);
    void setCirclePlayer(Player* newPlayer);
    void setCurrentPlayer(Player* newPlayer);

private:
    Player *currentPlayer;
    Player *ex;
    Player *circle;
    QVector<QString> board;
};

#endif // PLAYERS_H
