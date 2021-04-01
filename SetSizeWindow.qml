import QtQuick 2.11
import QtQuick.Controls 2.12
Item {
    id: windowRoot
    Column{
        x: 30; y: 20
        spacing: windowRoot.height/10
        Text {
            text: "Welcome to the TicTacToe game.
                    \nSet the size of the game.
                    \nNote that the winner is the player who place marks in the all of the vertical, horizontal or diagonal row.
                    \nHave fun!"
            font.pixelSize: Math.min(windowRoot.height/35, windowRoot.width/50)
        }

        Row{
            spacing: windowRoot.height/10
            Text {
                anchors.verticalCenter: spinbox.verticalCenter
                text: "Board size: "
                font.pixelSize: Math.min(windowRoot.height/35, windowRoot.width/50)

            }

            SpinBox{
                id: spinbox
                value: 3
                from: 3
                editable: true
                to: 40
            }
        }
    }

    Rectangle {
        color: "#e0e0e0"
        height: parent.height/12
        width: parent.width/4
        radius: 5
        border {color: "#c9c9c9"; width: 1}
        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: 10
            bottomMargin: 10
        }
        Text {
            text: "Play"
            anchors.centerIn: parent
            font.pixelSize: Math.min(parent.width/2, parent.height/2)
        }
        MouseArea{
            anchors.fill:  parent
            hoverEnabled: true
            onEntered: {
                buttonEnter.target = parent
                buttonEnter.running = true
            }
            onExited: {
                buttonExit.target = parent
                buttonExit.running = true
            }
            onPressed: {
                buttonPressed.target = parent
                buttonPressed.running = true
            }
            onReleased: {
                buttonReleased.target = parent
                buttonReleased.running = true
            }

            onClicked: {
                game.boardSize = spinbox.value
                console.log(game.boardSize)
                gameLoader.source = "GameLayout.qml"
            }
        }
        ColorAnimation {
            property: "color"
            id: buttonEnter
            to: "#a3a3a3"
            duration: 200
        }
        ColorAnimation {
            property: "color"
            id: buttonExit
            to: "#e0e0e0"
            duration: 200
        }
        ColorAnimation {
            property: "color"
            id: buttonPressed
            to: "#7a7a7a"
            duration: 200
        }
        ColorAnimation {
            property: "color"
            id: buttonReleased
            to: "#a3a3a3"
            duration: 200
        }
    }
}

