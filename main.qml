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
            id: _00
            Layout.fillWidth: true
            Layout.fillHeight: true

            MouseArea {
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
            }
        }

        Rectangle {
            Layout.preferredWidth: lineSize
            Layout.fillHeight: true
            color: "black"
            Layout.rowSpan: 5
        }

        Rectangle {
            id: _10
            Layout.fillWidth: true
            Layout.fillHeight: true
            MouseArea {
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
            }
        }

        Rectangle {
            Layout.preferredWidth: lineSize
            Layout.fillHeight: true
            color: "black"
            Layout.rowSpan: 5
        }

        Rectangle {
            id: _20
            Layout.fillWidth: true
            Layout.fillHeight: true
            MouseArea {
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
            }
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
            id: _01
            Layout.fillWidth: true
            Layout.fillHeight: true
            MouseArea {
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
            }
        }
        Rectangle {
            id: _11
            Layout.fillWidth: true
            Layout.fillHeight: true
            MouseArea {
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
            }
        }
        Rectangle {
            id: _21
            Layout.fillWidth: true
            Layout.fillHeight: true
            MouseArea {
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
            }
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
            id: _02
            Layout.fillWidth: true
            Layout.fillHeight: true
            MouseArea {
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
            }
        }
        Rectangle {
            id: _12
            Layout.fillWidth: true
            Layout.fillHeight: true
            MouseArea {
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
            }
        }
        Rectangle {
            id: _22
            Layout.fillWidth: true
            Layout.fillHeight: true
            MouseArea {
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
            }
        }
    }
    ColorAnimation  {
        id: insertHover
        alwaysRunToEnd: true
        property: "color"
        duration: 100
        from: "white"
        to: "lightgray"
    }
    ColorAnimation {
        id: exitHover
        alwaysRunToEnd: true
        from: "lightgray"
        to: "white"
        property: "color"
        duration: 100
    }
}
