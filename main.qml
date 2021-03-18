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
            leftMargin: 9
            rightMargin: 5
            bottomMargin: 5
            fill: parent
        }
        columns: 5
        columnSpacing: 0
        rowSpacing: 0

        Area {
            id: _00
        }

        Rectangle {
            Layout.preferredWidth: lineSize
            Layout.fillHeight: true
            color: "black"
            Layout.rowSpan: 5
        }

        Area {
            id: _10
        }

        Rectangle {
            Layout.preferredWidth: lineSize
            Layout.fillHeight: true
            color: "black"
            Layout.rowSpan: 5
        }

        Area {
            id: _20
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
            id: _01
        }
        Area {
            id: _11
        }
        Area {
            id: _21
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
            id: _02
        }
        Area {
            id: _12
        }
        Area {
            id: _22
        }
    }
}
