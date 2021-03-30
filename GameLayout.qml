import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Item{
    Rectangle {
        color: "black"
        anchors.fill: parent
    }
    Rectangle{
        color: "white"
        width: parent.width
        height: parent.height*0.05
        id: currentPlayerInfo
        Text {
            text: "Current player: " + game.currentPlayer.sign
            font.pixelSize: parent.height-2
        }
    }


    GridLayout {
        id: layout
        property var mouseAreaEnabled: true
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: currentPlayerInfo.bottom
        }
        columns: game.boardSize
        columnSpacing: 0
        rowSpacing: 0

        Repeater {
            model: game.boardSize*game.boardSize
            Area
            {
                value: index
            }
        }
    }
}
