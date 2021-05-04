#include "game.h"
#include <QDebug>
Game::Game(Player* x, Player* o)
{
    m_ex = x;
    m_circle = o;
    m_currentPlayer = m_ex;
    m_count = 0;
    m_winner = nullptr;
    m_boardSize = 0;
}
Game::~Game()
{
    delete m_ex;
    delete m_currentPlayer;
    delete m_circle;
    delete m_winner;

}
Player* Game::getExPlayer()
{
    return m_ex;
}
Player* Game::getCirclePlayer()
{
    return m_circle;
}
Player* Game::getCurrentPlayer()
{
    return m_currentPlayer;
}

void Game::setExPlayer(Player* newPlayer)
{
    m_ex = newPlayer;
}

void Game::setCirclePlayer(Player* newPlayer)
{
    m_circle = newPlayer;
}
void Game::setCurrentPlayer(Player* newPlayer)
{
    m_currentPlayer = newPlayer;
    emit currentPlayerChanged();
}

void Game::updateBoard(QString text, int index)
{
    m_board[index] = text;
    m_count++;
    emit moveCountChanged();
}

Player* Game::getWinner()
{
    return m_winner;
}

bool Game::checkWinner()
{
    bool winned = true;
    int row = 0;
    do
    {
        QList<QString> col_arr;
        for(int col = 0; col<m_boardSize; col++)
        {
            col_arr.append(m_board[m_boardSize*row+col]);
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
    }while(!winned && row<m_boardSize);
    if(winned)
    {
        m_winner = m_currentPlayer;
        return true;
    }
    int col = 0;
    do
    {
        QList<QString> row_arr;
        for(int row = 0; row<m_boardSize; row++)
        {
            winned = true;
            row_arr.append(m_board[m_boardSize*row+col]);
        }
        for(int i=0; i< row_arr.size(); i++)
        {
            if(row_arr[0]!=row_arr[i] || row_arr[i] == "")
                winned = false;
        }
        col++;
    }while(!winned && col <m_boardSize);
    if(winned)
    {
        m_winner = m_currentPlayer;
        return true;
    }
    winned=true;
    QList<QString> arr;
    for(int i=0; i<m_boardSize; i++)
    {
        arr.append(m_board[m_boardSize*i+i]);
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
        m_winner = m_currentPlayer;
        return true;
    }
    winned = true;
    arr.clear();
    for(int i=1; i<=m_boardSize; i++)
    {
        arr.append(m_board[i*m_boardSize-i]);
    }
    for(int i=1; i<arr.size(); i++)
    {
        if(arr[0]!=arr[i]||arr[i]=="")
            winned = false;
    }
    if(winned)
    {
        m_winner = m_currentPlayer;
        return true;
    }
    if(m_count == m_boardSize*m_boardSize)
        return true;
    else
        return false;
}


int Game::getBoardSize()
{
    return m_boardSize;
}

void Game::setBoardSize(int newSize)
{
    m_boardSize = newSize;
    m_board.clear();
    m_board.resize(m_boardSize*m_boardSize);
    emit boardSizeChanged();
}

void Game::resetGame()
{
    m_currentPlayer = m_ex;
    m_board.clear();
    m_board.resize(m_boardSize*m_boardSize);
    m_count = 0;
    emit moveCountChanged();
    m_winner = nullptr;
}

int Game::getMoveCount()
{
    return m_count;
}
