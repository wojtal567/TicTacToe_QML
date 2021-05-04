#ifndef GAME_H
#define GAME_H

#include <player.h>
#include <QString>
#include <QVector2D>
class Game : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Player* currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer NOTIFY currentPlayerChanged)
    Q_PROPERTY(Player* exPlayer READ getExPlayer)
    Q_PROPERTY(Player* circlePlayer READ getCirclePlayer)
    Q_PROPERTY(int boardSize READ getBoardSize WRITE setBoardSize NOTIFY boardSizeChanged)
    Q_PROPERTY(int moveCount READ getMoveCount NOTIFY moveCountChanged)
    Q_PROPERTY(Player* winner READ getWinner)
public:
    Game(Player* x, Player* o);
    ~Game();
    Q_INVOKABLE void updateBoard(QString text, int index);
    Q_INVOKABLE bool checkWinner();
    Player* getExPlayer();
    Player* getCirclePlayer();
    Player* getCurrentPlayer();
    Player* getWinner();
    int getBoardSize();
    void setBoardSize(int newSize);
    void setExPlayer(Player* newPlayer);
    void setCirclePlayer(Player* newPlayer);
    void setCurrentPlayer(Player* newPlayer);
    int getMoveCount();
    Q_INVOKABLE void resetGame();
signals:
    void currentPlayerChanged();
    void moveCountChanged();
    void boardSizeChanged();
private:
    Player *m_currentPlayer;
    Player *m_ex;
    Player *m_circle;
    Player *m_winner;
    QVector<QString> m_board;
    int m_count;
    int m_boardSize;
};

#endif // GAME_H
