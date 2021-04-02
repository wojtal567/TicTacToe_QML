import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.15
Rectangle {
    id: dialogBox
    color: "white"
    border
    {
        color: "black"
        width: dialogBox.width/64
    }
    radius: width/32
    width: (resizeText.width+dialogSpinBox.width)*1.2
    height: root.height/3
    Text{
        id: resizeText
        anchors{
            top: dialogBox.top
            left: dialogBox.left
            leftMargin: 20
            topMargin: 20
        }
        text: "Board size: "
        font.pixelSize:dialogBox.parent.parent.width/20
    }
    SpinBox {
        id: dialogSpinBox
        value: game.boardSize
        from: 3
        editable: true
        to: 40
        height: resizeText.height*1.1
        width: resizeText.width/2
        font.pixelSize: resizeText.font.pixelSize/2

        up.indicator: Rectangle {
                height: parent.height
                anchors.right: parent.right
                anchors.top: parent.top
                implicitHeight: 40
                implicitWidth: parent.width/3
                color: dialogSpinBox.up.pressed ? "#bdbdbd" : "#e0e0e0"
                Text {
                    text: '+'
                    anchors.centerIn: parent
                    color: enabled ? "#26282a" : "#bdbdbd"
                }
            }
            down.indicator: Rectangle {
                height: parent.height
                anchors.left: parent.left
                anchors.top: parent.top
                implicitHeight: 40
                implicitWidth: parent.width/3
                color: dialogSpinBox.down.pressed ? "#bdbdbd" : "#e0e0e0"
                Text {
                    text: '-'
                    anchors.centerIn: parent
                    color: enabled ? "#26282a" : "#bdbdbd"
                }
            }
        anchors{
            verticalCenter: resizeText.verticalCenter
            left: resizeText.right
        }
    }

    Rectangle {
        id: playButton
        color: "#e0e0e0"
        height: dialogBox.height/4
        width: dialogBox.width/3
        radius: 5
        border {color: "#c9c9c9"; width: 1}
        anchors {
            right: dialogBox.right
            bottom: dialogBox.bottom
            bottomMargin: dialogBox.border.width*1.2
            rightMargin: dialogBox.border.width*1.2
        }
        Text {
            text: "Play"
            font.pixelSize: Math.min(parent.height/2, parent.width/2)
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:  parent
            hoverEnabled: true
            onEntered: {
                buttonEnter.target = playButton
                buttonEnter.running = true
            }
            onExited: {
                buttonExit.target = playButton
                buttonExit.running = true
            }
            onPressed: {
                buttonPressed.target = playButton
                buttonPressed.running = true
            }
            onReleased: {
                if(containsMouse)
                {
                    buttonReleased.target = playButton
                    buttonReleased.running = true
                }
            }
            onClicked: {
                game.boardSize = dialogSpinBox.value
                gameLoader.source = ""
                gameLoader.source = "GameLayout.qml"
                blur.stopAnimation.running = true
                dialogLoader.source = ""
                game.resetGame()
            }
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
