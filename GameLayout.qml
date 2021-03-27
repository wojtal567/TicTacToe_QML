import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
GridLayout {
    id: layout
    property var mouseAreaEnabled: true
    anchors{
//        topMargin: 5
//        leftMargin: 9
//        rightMargin: 5
//        bottomMargin: 5
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
