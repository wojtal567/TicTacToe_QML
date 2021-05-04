#include "player.h"

Player::Player(QChar sign)
{
    m_sign = sign;
}

QChar Player::getSign() const
{
    return m_sign;
}
void Player::setSign(QChar sign)
{
    m_sign = sign;
    emit signChanged();
}
