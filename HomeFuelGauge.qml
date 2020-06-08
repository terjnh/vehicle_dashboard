import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    Row {
        id: gaugeRow
        anchors.left: parent.left
        width: 100
        height: 205
        Rectangle {
            id: fuelRect
            width: 50
            height: 200
            anchors.left: parent.left
            anchors.bottom: parent.bottom; anchors.bottomMargin: 10;
            color: "green"
            NumberAnimation on height {
                id: decreaseFuel
                running: false
                from: fuelRect.height; to: 0
                duration: 2000;
            }
        }
        Label {
            id: lblFuel
            text: "F\n\n\n\n\n\nE"
            font.pixelSize: 25
            anchors.left: fuelRect.right
            anchors.leftMargin: 5
        }
    }
    Row {
        id: gaugeCtrlRow
        anchors.top: gaugeRow.bottom
        Button {
            id: emptyBtn
            text: "Empty Fuel"
            onClicked: {
                decreaseFuel.running = true
            }
        }
    }


}
