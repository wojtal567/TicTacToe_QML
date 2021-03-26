import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import Qt5Compat.GraphicalEffects
Window {

    width: 640
    height: 480
    visible: true
    id: root
    property var lineSize: Math.min(root.width/48, root.height/48)
    property alias loaderItem: dialogLoader.item
    title: qsTr("TicTacToe")
    GridLayout {
        id: layout
        property var mouseAreaEnabled: true
        anchors{
            topMargin: 5
            leftMargin: 9
            rightMargin: 5
            bottomMargin: 5
            fill: parent
        }
        columns: 5
        columnSpacing: 0
        rowSpacing: 0

        Area {
            id: _0
            value: 0
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }

        Rectangle {
            Layout.preferredWidth: lineSize
            Layout.fillHeight: true
            color: "black"
            Layout.rowSpan: 5
        }

        Area {
            id: _1
            value: 1
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }

        Rectangle {
            Layout.preferredWidth: lineSize
            Layout.fillHeight: true
            color: "black"
            Layout.rowSpan: 5
        }

        Area {
            id: _2
            value: 2
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }

        Repeater
        {
            id: firstLineRow
            model: 3
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: lineSize
                color: "black"
            }
        }

        Area {
            id: _3
            value: 3
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }
        Area {
            id: _4
            value: 4
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }
        Area {
            id: _5
            value: 5
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }

        Repeater
        {
            id: secondLineRow
            model: 3
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: lineSize
                color: "black"
            }
        }

        Area {
            id: _6
            value: 6
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }
        Area {
            id: _7
            value: 7
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }
        Area {
            id: _8
            value: 8
            property var mouseAreaEnabled: parent.mouseAreaEnabled
        }
    }
    Blur {id: blur}
    Loader{
        id:dialogLoader
        anchors.centerIn: layout
        onSourceChanged: loadAnimation.running = true
        NumberAnimation {
            id: loadAnimation
            target: dialogLoader.item
            property: "scale"
            duration: 200
            easing.type: Easing.InOutQuad
            from: 0
            to: 1
        }
    }
}
