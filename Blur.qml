import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import Qt5Compat.GraphicalEffects 1.0
FastBlur {
    id: blur
    source: layout
    anchors.fill: layout
    //radius: 64
    property alias animation: blur_start_animation
    NumberAnimation {
        id: blur_start_animation
        target: blur
        property: "radius"
        duration: 200
        easing.type: Easing.InOutQuad
        to: 64
    }
}
