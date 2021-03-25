import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
Window {

    width: 640
    height: 480
    visible: true
    id: root
    property var lineSize: Math.min(root.width/48, root.height/48)
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
            id: _0
            value: 0
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
        }
        Area {
            id: _4
            value: 4
        }
        Area {
            id: _5
            value: 5
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
        }
        Area {
            id: _7
            value: 7
        }
        Area {
            id: _8
            value: 8
        }
    }
}
