import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

import com.company.fueldata 1.0

Item {

    property var fuelMax: 200;
    property var fuelValue: fuelData.fuelValue


    Row {
        id: gaugeRow
        anchors.left: parent.left
        anchors.leftMargin: 20
        width: 100
        height: 205
        Rectangle {
            id: fuelRect
            width: 50
            height: fuelValue
            anchors.left: parent.left
            anchors.bottom: parent.bottom; anchors.bottomMargin: 10;
            color: "green"
            NumberAnimation on height {
                id: decreaseFuel
                running: false
                from: fuelValue; to: 0
                duration: 2000;
            }
            NumberAnimation on height {
                id: increaseFuel
                running: false
                from: fuelValue; to: fuelMax
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
    Column {
        id: gaugeCtrlRow
        anchors.top: gaugeRow.bottom
        Button {
            id: emptyBtn
            text: "Empty Fuel"
            onClicked: {
                decreaseFuel.running = true
            }
        }
        Button {
            id: fillBtn
            width: emptyBtn.width
            text: "Fill Fuel"
            onClicked: {
                increaseFuel.running = true
            }
        }
    }


}
