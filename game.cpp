#include "game.h"
#include <QDebug>
Game::Game(Player* x, Player* o)
{
    this->ex = x;
    this->circle = o;
    this->currentPlayer = this->ex;
    board.resize(3*3);
    this->count = 0;
    this->winner = NULL;
}

Player* Game::getExPlayer()
{
    return this->ex;
}
Player* Game::getCirclePlayer()
{
    return this->circle;
}
Player* Game::getCurrentPlayer()
{
    return this->currentPlayer;
}

void Game::setExPlayer(Player* newPlayer)
{
    this->ex = newPlayer;
}

void Game::setCirclePlayer(Player* newPlayer)
{
    this->circle = newPlayer;
}
void Game::setCurrentPlayer(Player* newPlayer)
{
    this->currentPlayer = newPlayer;
}

void Game::updateBoard(QString text, int index)
{
    this->board[index] = text;
    this->count++;
}

Player* Game::getWinner()
{
    return this->winner;
}

bool Game::checkWinner()
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
        this->winner = this->currentPlayer;
        return true;
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
        this->winner = this->currentPlayer;
        return true;
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
        this->winner = this->currentPlayer;
        return true;
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
        this->winner = this->currentPlayer;
        return true;
    }
    if(this->count == 9)
        return true;
    else
        return false;
}

void Game::resetGame()
{
    this->currentPlayer = this->ex;
    board.clear();
    board.resize(3*3);
    this->count = 0;
    this->winner = NULL;
}
