#ifndef PLAYER_H
#define PLAYER_H
#include <QObject>

class Player : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QChar sign READ getSign WRITE setSign)

public:
    Player(QChar _sign);

    QChar getSign() const;
    void setSign(QChar _sign);
private:
    QChar sign;
};

#endif // PLAYER_H
