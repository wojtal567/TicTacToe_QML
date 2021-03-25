#include "players.h"
#include <QDebug>
Players::Players(Player* x, Player* o)
{
    this->ex = x;
    this->circle = o;
    this->currentPlayer = this->ex;
    board.resize(3*3);
}

Player* Players::getExPlayer()
{
    return this->ex;
}
Player* Players::getCirclePlayer()
{
    return this->circle;
}
Player* Players::getCurrentPlayer()
{
    return this->currentPlayer;
}

void Players::setExPlayer(Player* newPlayer)
{
    this->ex = newPlayer;
}

void Players::setCirclePlayer(Player* newPlayer)
{
    this->circle = newPlayer;
}
void Players::setCurrentPlayer(Player* newPlayer)
{
    this->currentPlayer = newPlayer;
}

void Players::updateBoard(QString text, int index)
{
    this->board[index] = text;
    checkWinner();
}


void Players::checkWinner()
{
    int size = 3;
    bool winned = true;
    int row = 0;
    do
    {
        QList<QString> col_arr;
        for(int col = 0; col<size ; col++)
        {
            col_arr.append(board[size*row+col]);
        }
        winned = true;
        for(int i=0; i< col_arr.size(); i++)
        {
            if(col_arr[0]!=col_arr[i] || col_arr[0]=="")
            {
                winned = false;
            }
        }
        row++;
    }while(!winned && row<size);
    if(winned)
    {
        qDebug() <<"Winned1";
        return;
    }
    int col = 0;
    do
    {
        QList<QString> row_arr;
        for(int row = 0; row<size; row++)
        {
            winned = true;
            row_arr.append(board[size*row+col]);
        }
        for(int i=0; i< row_arr.size(); i++)
        {
            if(row_arr[0]!=row_arr[i] || row_arr[i] == "")
                winned = false;
        }
        col++;
    }while(!winned && col <size);
    if(winned)
    {
        qDebug()<<"Winned2";
        return;
    }
    winned=true;
    QList<QString> arr;
    for(int i=0; i<size; i++)
    {
        arr.append(board[size*i+i]);
    }
    int i=1;
    do
    {
        if(arr[0]!=arr[i]||arr[i]=="")
            winned=false;
        i++;
    }while(i<arr.size());
    if(winned)
    {
        qDebug()<<"Winned3";
        return;
    }
    winned = true;
    arr.clear();
    for(int i=1; i<=size; i++)
    {
        arr.append(board[i*size-i]);
    }
    for(int i=1; i<arr.size(); i++)
    {
        if(arr[0]!=arr[i]||arr[i]=="")
            winned = false;
    }
    if(winned)
    {
        qDebug()<<"Wygraned3";
        return;
    }
}
