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
    property alias loaderItem: dialogLoader.item
    property alias loader: gameLoader
    title: qsTr("TicTacToe")
    Loader {
        id: gameLoader
        property alias layout: gameLoader.item
        source: "GameLayout.qml"
        anchors.fill: parent
    }

    Blur {id: blur}
    Loader{
        id:dialogLoader
        anchors.centerIn: gameLoader
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
