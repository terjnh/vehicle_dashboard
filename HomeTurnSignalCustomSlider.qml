import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Shapes 1.12

Slider {
    orientation: Qt.Horizontal
    anchors.centerIn: parent
    width: 80; height: 25
    from: 0.0; to: 1.0
    value: 0.5
    snapMode: Slider.SnapAlways
    stepSize: 0.5
    onMoved: {
        if(value == 0.0) {
            homeTurnSignals.animationTurnLeft = true
            homeTurnSignals.animationTurnRight = false
            homeTurnSignals.rightSignalOpacity = 0.2
            console.log("Left Turn Signal triggered")
        }
        if(value == 0.5) {
            homeTurnSignals.animationTurnLeft = false
            homeTurnSignals.animationTurnRight = false
            homeTurnSignals.rightSignalOpacity = 0.2
            homeTurnSignals.leftSignalOpacity = 0.2
        }
        if(value == 1.0) {
            homeTurnSignals.animationTurnLeft = false
            homeTurnSignals.animationTurnRight = true
            homeTurnSignals.leftSignalOpacity = 0.2
            console.log("Right Turn Signal triggered")
        }
    }


    background: Rectangle {
        opacity: 0.2
        anchors.horizontalCenter: parent.horizontalCenter
        implicitHeight: parent.height
        implicitWidth: parent.width
        radius: 10
        color: "#bdbebf"

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 80
            height: 10
            color: "#f7ff57"
            radius: 5
        }
    }

}
