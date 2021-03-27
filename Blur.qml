import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
FastBlur {
    id: blur
    source: gameLoader.layout
    anchors.fill: gameLoader
    //radius: 64
    property alias startAnimation: blur_start_animation
    property alias stopAnimation: blur_stop_animation
    NumberAnimation {
        id: blur_start_animation
        target: blur
        property: "radius"
        duration: 200
        easing.type: Easing.InOutQuad
        to: 64
    }
    NumberAnimation {
        id: blur_stop_animation
        target: blur
        property: "radius"
        duration: 200
        easing.type: Easing.InOutQuad
        to: 0
    }
}
