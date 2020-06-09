import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    id: speedpage
    width: parent.width; height: parent.height
    anchors.horizontalCenter: parent.horizontalCenter

    property var speed: "0"
    property var rpm: "0"

    Row {
        id: odomRow
        width: parent.width
        height: 70
        anchors.horizontalCenter: parent.horizontalCenter
        Label {
            text: speed.toString() + " km/h"
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 60
        }
    }
    Row {
        id: dialRow
        spacing: 16
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: odomRow.bottom
        anchors.topMargin: 20
        Dial {
            id: dialSpeed
            value: 0.0
            onValueChanged: {
                speed = Math.round((value * 100) * 1) / 1
                aniDialRpm.running = true
                if(value == 0.0) { aniDialRpm.running = false; rpm = 0; }
            } //onValueChanged
        }
        Dial {
            id: dialRpm
            value: rpm

            SequentialAnimation {
                id: aniDialRpm
                running: false
                loops: Animation.Infinite
                NumberAnimation { target: dialRpm; property: "value"; from: 0.05; to: 0.1; duration: 250 }
                NumberAnimation { target: dialRpm; property: "value"; from: 0.1; to: 0.06; duration: 250 }
                NumberAnimation { target: dialRpm; property: "value"; from: 0.06; to: 0.15; duration: 250 }
                NumberAnimation { target: dialRpm; property: "value"; from: 0.15; to: 0.05; duration: 250 }
            }
        }
    }
}
