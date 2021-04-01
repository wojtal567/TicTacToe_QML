import QtQuick 2.0
import QtQuick.Layouts 1.12
Item {
    Layout.fillWidth: true
    Layout.fillHeight: true
    property var placed: place.text
    id: root
    property var value: parent.value
    property var mouseAreaEnabled: parent.mouseAreaEnabled
    Rectangle {
        id: rect_
        anchors
        {
            fill: parent
            leftMargin: Math.min(parent.width/80, parent.height/80)
            rightMargin: Math.min(parent.width/80, parent.height/80)
            topMargin: Math.min(parent.width/80, parent.height/80)
            bottomMargin: Math.min(parent.width/80, parent.height/80)
        }
        radius: 10
        MouseArea {
            id: area
            anchors.fill: parent
            hoverEnabled: true
            enabled: root.mouseAreaEnabled
            onEntered: {
                insertHover.start()
            }
            onExited: {
                exitHover.start()
            }
            onPressed: {
                press.start()
            }
            onReleased: {
                if(area.containsMouse)
                {
                    release.start()
                }
            }
            onClicked: {
                if(place.text == "")
                {
                    place.text = game.currentPlayer.sign
                    game.updateBoard(place.text, root.value)
                    if(game.checkWinner())
                    {
                        layout.mouseAreaEnabled = false;
                        exitHover.start();
                        blur.startAnimation.running = true
                        dialogLoader.source = "EndDialogBox.qml"
                        if(game.winner === null)
                            loaderItem.textInfo.text = "Game ended in "+game.moveCount+" moves.\nDraw\nDo you want to play again?"
                        else
                            loaderItem.textInfo.text = "Game ended in "+game.moveCount+" moves.\nPlayer " + game.winner.sign + " won\nDo you want to play again?"
                    }
                    if(game.currentPlayer === game.exPlayer)
                        game.currentPlayer = game.circlePlayer
                    else
                        game.currentPlayer = game.exPlayer
                }
                else
                {
                    placeTaken.start()
                }
            }
        }
        Text {
            id: place
            anchors.centerIn: parent
            font.pixelSize:  Math.min(parent.height, parent.width)
        }
    }
    ParallelAnimation{
        id: placeTaken

        SequentialAnimation {
            ColorAnimation {
                property: "color"
                target: rect_
                to: "red"
                duration: 200
            }

            ColorAnimation {
                target: rect_
                property: "color"
                to: "lightgray"
                duration: 200
            }
        }

        SequentialAnimation{
            RotationAnimation{
                direction: RotationAnimation.Clockwise
                target: rect_
                duration: 50
                to: 10
            }
            RotationAnimation{
                direction: RotationAnimation.Counterclockwise
                target: rect_
                duration: 100
                to: -10
            }
            RotationAnimation{
                direction: RotationAnimation.Clockwise
                target: rect_
                duration: 50
                to: 0
            }
        }
    }

    ColorAnimation  {
        id: insertHover
        target: rect_
        property: "color"
        duration: 100
        to: "lightgray"
    }
    ColorAnimation {
        id: exitHover
        target: rect_
        to: "white"
        property: "color"
        duration: 100
    }
    ColorAnimation {
        id: press
        target: rect_
        to: "#a6a6a6"
        duration: 100
        property: "color"
    }
    ColorAnimation {
        id: release
        target: rect_
        to: "lightgray"
        duration: 100
        property: "color"
    }
}

