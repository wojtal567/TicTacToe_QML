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
            onClicked: console.log(dialogBox.scale)
        }
    }
}
