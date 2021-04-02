import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
Rectangle {
    id: dialogBox
    color: "white"
    property alias textInfo: textInfo
    border
    {
        color: "black"
        width: dialogBox.width/64
    }
    radius: width/32
    width: root.width/2
    height: root.height/3
    Text{
        anchors{
            top: dialogBox.top
            left: dialogBox.left
            leftMargin: 10
            topMargin: 10
        }
        id: textInfo
        font.pixelSize: Math.min(dialogBox.height/7, dialogBox.width/14)
    }

    Rectangle {
        id: noButton
        color: "#e0e0e0"
        height: dialogBox.height/4
        width: dialogBox.width/3
        radius: 5
        border {color: "#c9c9c9"; width: 1}
        anchors {
            right: dialogBox.right
            bottom: dialogBox.bottom
            rightMargin: dialogBox.border.width+2
            bottomMargin: dialogBox.border.width+2
        }
        Text {
            text: "No"
            font.pixelSize: Math.min(parent.height/2, parent.width/2)
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:  parent
            hoverEnabled: true
            onEntered: {
                buttonEnter.target = noButton
                buttonEnter.running = true
            }
            onExited: {
                buttonExit.target = noButton
                buttonExit.running = true
            }
            onPressed: {
                buttonPressed.target = noButton
                buttonPressed.running = true
            }
            onReleased: {
                if(containsMouse)
                {
                    buttonReleased.target = noButton
                    buttonReleased.running = true
                }
            }
            onClicked: {
                Qt.quit()
            }
        }
    }
    Rectangle {
        id: yesButton
        color: "#e0e0e0"
        height: dialogBox.height/4
        width: dialogBox.width/3
        radius: 5
        border {color: "#c9c9c9"; width: 1}
        anchors {
            right: noButton.left
            bottom: dialogBox.bottom
            bottomMargin: dialogBox.border.width+2
            rightMargin: dialogBox.border.width
        }
        Text {
            text: "Yes"
            font.pixelSize: Math.min(parent.height/2, parent.width/2)
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill:  parent
            hoverEnabled: true
            onEntered: {
                buttonEnter.target = yesButton
                buttonEnter.running = true
            }
            onExited: {
                buttonExit.target = yesButton
                buttonExit.running = true
            }
            onPressed: {
                buttonPressed.target = yesButton
                buttonPressed.running = true
            }
            onReleased: {
                if(containsMouse)
                {
                    buttonReleased.target = yesButton
                    buttonReleased.running = true
                }
            }
            onClicked: {
                dialogLoader.source = "ResizeDialogBox.qml"
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
