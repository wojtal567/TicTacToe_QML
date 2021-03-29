import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0

Item{
    Rectangle {
        color: "black"
        anchors.fill: parent
    }

    GridLayout {
        id: layout
        property var mouseAreaEnabled: true
        anchors{
            fill: parent
        }
        columns: 4
        columnSpacing: 0
        rowSpacing: 0

        Repeater {
            model: 16
            Area
            {
                value: index
            }
        }
    }
}
