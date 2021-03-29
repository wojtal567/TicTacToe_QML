#include "player.h"

Player::Player(QChar _sign)
{
    this->sign = _sign;
}

QChar Player::getSign() const
{
    return this->sign;
}
void Player::setSign(QChar _sign)
{
    this->sign = _sign;
    emit signChanged();
}
