import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    id: speedpage
    width: parent.width; height: parent.height
    anchors.horizontalCenter: parent.horizontalCenter

    property var speed: "0"

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
            id: dialRpm
            value: 0.0
            onValueChanged: {
                speed = Math.round((value * 100) * 1) / 1
            }
        }
        Dial {
            id: dialSpeed

        }
    }
}
