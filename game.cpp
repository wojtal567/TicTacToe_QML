#include "game.h"
#include <QDebug>
Game::Game(Player* x, Player* o)
{
    this->ex = x;
    this->circle = o;
    this->currentPlayer = this->ex;
    this->count = 0;
    this->winner = NULL;
    this->boardSize = 0;
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
    emit currentPlayerChanged();
}

void Game::updateBoard(QString text, int index)
{
    this->board[index] = text;
    this->count++;
    emit moveCountChanged();
}

Player* Game::getWinner()
{
    return this->winner;
}

bool Game::checkWinner()
{
    bool winned = true;
    int row = 0;
    do
    {
        QList<QString> col_arr;
        for(int col = 0; col<this->boardSize; col++)
        {
            col_arr.append(board[this->boardSize*row+col]);
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
    }while(!winned && row<this->boardSize);
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
        for(int row = 0; row<this->boardSize; row++)
        {
            winned = true;
            row_arr.append(board[this->boardSize*row+col]);
        }
        for(int i=0; i< row_arr.size(); i++)
        {
            if(row_arr[0]!=row_arr[i] || row_arr[i] == "")
                winned = false;
        }
        col++;
    }while(!winned && col <this->boardSize);
    if(winned)
    {
        qDebug()<<"Winned2";
        this->winner = this->currentPlayer;
        return true;
    }
    winned=true;
    QList<QString> arr;
    for(int i=0; i<this->boardSize; i++)
    {
        arr.append(board[this->boardSize*i+i]);
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
    for(int i=1; i<=this->boardSize; i++)
    {
        arr.append(board[i*this->boardSize-i]);
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
    if(this->count == this->boardSize*this->boardSize)
        return true;
    else
        return false;
}


int Game::getBoardSize()
{
    return this->boardSize;
}

void Game::setBoardSize(int newSize)
{
    this->boardSize = newSize;
    board.clear();
    board.resize(this->boardSize*this->boardSize);
    emit boardSizeChanged();
}

void Game::resetGame()
{
    this->currentPlayer = this->ex;
    board.clear();
    board.resize(this->boardSize*this->boardSize);
    this->count = 0;
    emit moveCountChanged();
    this->winner = NULL;
}

int Game::getMoveCount()
{
    return this->count;
}
