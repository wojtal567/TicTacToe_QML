#ifndef PLAYER_H
#define PLAYER_H
#include <QObject>

class Player : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QChar sign READ getSign WRITE setSign NOTIFY signChanged)

public:
    Player(QChar _sign);

    QChar getSign() const;
    void setSign(QChar _sign);
signals:
    void signChanged();
private:
    QChar m_sign;
};

#endif // PLAYER_H
