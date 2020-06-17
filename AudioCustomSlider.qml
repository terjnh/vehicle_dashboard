import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Shapes 1.12

Slider {
    orientation: Qt.Vertical
    anchors.horizontalCenter: parent.horizontalCenter
    width: 50; height: 120
    from: 0; to: 1
    value: playMusic.volume
    onMoved: {
        playMusic.volume = value
    }

    //AudioVolumeShape {}

    // Custom Slider
    background: Rectangle {
        opacity: 0.2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0
        implicitWidth: 50
        implicitHeight: 120
        width: 32
        height: 120
        radius: 25
        color: "#bdbebf"

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 10
            height: 120
            color: "#21be2b"
            radius: 5
        }
    } //Custom Slider
}
