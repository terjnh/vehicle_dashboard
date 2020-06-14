import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    anchors.fill: parent
    width: parent.width; height: parent.height

    property var engineState: "OFF"

    Column {
        anchors.fill: parent
        width: parent.width; height: parent.height

        Label {
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            width: parent.width;
            height: 30
            font.pixelSize: 16
            text: "Ignition"; color: "#72d8f8"
        }

        Switch {
            width: parent.width; height: 30
            onCheckedChanged: {
                if(checked == false){
                    engineState = "OFF"
                    timerHome.timerStop();
                    fuelData.timerStop();
                    homeStatus.status_info = "Engine\nStopped"
                    homeMisc.batteryIcon.opacity = 0.2
                    console.log("Engine: " + engineState)
                } else {
                    engineState = "ON"
                    timerHome.timerStart();
                    fuelData.timerStart();
                    homeStatus.status_info = "Engine\nStarted"
                    homeMisc.batteryIcon.opacity = 1.0
                    console.log("Engine: " + engineState)
                }
            }
        }
    }
}
