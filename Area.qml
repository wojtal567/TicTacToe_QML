import QtQuick 2.0
import QtQuick.Layouts 1.12
Item {
    Layout.fillWidth: true
    Layout.fillHeight: true
    Rectangle {
        anchors
        {
            fill: parent
            leftMargin: Math.min(parent.width/80, parent.height/80)
            rightMargin: Math.min(parent.width/80, parent.height/80)
            topMargin: Math.min(parent.width/80, parent.height/80)
            bottomMargin: Math.min(parent.width/80, parent.height/80)
        }
        radius: 10
        MouseArea {
            id: area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                insertHover.target = parent
                insertHover.start()
            }
            onExited: {
                exitHover.target = parent
                exitHover.start()
            }
            onPressed: {
                press.target = parent
                press.start()
            }
            onReleased: {
                if(area.containsMouse)
                {
                    release.target = parent
                    release.start()
                }
            }
        }
        Text {
            id: place
            text: "X"
            anchors.centerIn: parent
            font.pixelSize:  Math.min(parent.height, parent.width)
        }
    }

    ColorAnimation  {
        id: insertHover
        property: "color"
        duration: 100
        to: "lightgray"
    }
    ColorAnimation {
        id: exitHover
        to: "white"
        property: "color"
        duration: 100
    }
    ColorAnimation {
        id: press
        to: "#a6a6a6"
        duration: 100
        property: "color"
    }
    ColorAnimation {
        id: release
        to: "lightgray"
        duration: 100
        property: "color"
    }
}
