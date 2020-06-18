import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Shapes 1.12

Slider {
    orientation: Qt.Vertical
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    anchors.leftMargin: 0
    width: 30; height: parent.height
    from: 0.0; to: 1.0
    value: 0.0
    snapMode: Slider.SnapAlways
    stepSize: 0.5

    onMoved: {
        if(value == 0.5) {
            imgLowBeam.opacity = 1.0
            imgHighBeam.opacity = 0.2
        }
        else if(value == 1.0) {
            imgLowBeam.opacity = 0.2
            imgHighBeam.opacity = 1.0
        }
        else {
            imgLowBeam.opacity = 0.2
            imgHighBeam.opacity = 0.2
        }
    }

    background: Rectangle {
        opacity: 0.2
        height: parent.height
        width: parent.width
        radius: 15
        color: "#bdbebf"

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width / 3
            height: parent.height
            color: "#f7ff57"
            radius: 7
        }
    }
}
