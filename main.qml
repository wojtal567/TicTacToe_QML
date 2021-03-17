import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
Window {

    width: 640
    height: 480
    visible: true
    id: root
    property var lineSize: root.width/48
    title: qsTr("Hello World")
    GridLayout {
        anchors{
            topMargin: 5
            leftMargin: 5
            rightMargin: 5
            bottomMargin: 5

            fill: parent
        }
        columns: 5
        columnSpacing: 0
        rowSpacing: 0
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "pink"
        }
        Rectangle {
            Layout.preferredWidth: lineSize
            Layout.fillHeight: true
            color: "black"
            Layout.rowSpan: 5
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "gray"
        }
        Rectangle {
            Layout.preferredWidth: lineSize
            Layout.fillHeight: true
            color: "black"
            Layout.rowSpan: 5
        }



        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "cyan"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: lineSize
            color: "black"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: lineSize
            color: "black"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: lineSize
            color: "black"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "cyan"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "purple"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "blue"
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: lineSize
            color: "black"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: lineSize
            color: "black"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: lineSize
            color: "black"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "cyan"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "yellow"
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "red"
            Text {
                id: redClick
                Layout.fillWidth: true
                Layout.fillHeight: true
                font.pixelSize: parent.width/2
                color: "pink"
                text: "chuj"
                visible: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    redClick.visible = !redClick.visible
                }
            }
       }
    }
}
