import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

import com.company.timer 1.0
import com.company.fueldata 1.0

Item {
    id: speedpage
    width: parent.width; height: parent.height
    anchors.horizontalCenter: parent.horizontalCenter

    property int speed: 0
    property int maxSpeed: 100
    property int accelerateDuration: 5000
    property int decelerateDuration: 8000

    property var rpm: 0

    // Pass speed property to HomeGear.qml
    // Use a jS function to assign value to gearValue, which changes based on variable speed
    property alias gearNum: speedpage.gearValue
    property var gearValue: gearCalc()

    property alias dialSpeedValue: dialSpeed.value

    function gearCalc() {
        var gearValue = Math.round(speedpage.speed / 20);
        return gearValue;
    }


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
            color: "#72d8f8"
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
            value: speed / 100
            onValueChanged: {
                speed = Math.round((value * 100) * 1) / 1
                aniDialRpm.running = true
                if(value == 0.0) { aniDialRpm.running = false; rpm = 0; }

                // Binds speed variable to speedValue in Q_PROPERTY (Timer C++ Class)
                timerHome.speedValue = speed
                homeTemperature.temperatureValue = (speed * 1.2)
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
    } //Row (id: dialRow)

    Row {
        id: pedalsRow
        spacing: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: dialRow.bottom; anchors.topMargin: 30

        Rectangle {
            id: brakePedal
            width: 60; height: 100
            radius: 10
            Label {
                anchors.centerIn: parent
                text: "S"; font.pixelSize: 40
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                onPressAndHold: {
                    speedDecrease.running = false
                    speedDecrease.duration = 2000
                    speedDecrease.running = true
                }
            }
        }

        Rectangle {
            id: acceleratePedal
            width: 60; height: 100
            radius: 10
            color: homeIgnition.engineState == "ON" ? "white" : "black"
            Label {
                anchors.centerIn: parent
                text: "W"; font.pixelSize: 40
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                enabled: homeIgnition.engineState == "ON" ? true : false
                onPressAndHold: {
                    speedDecrease.running = false
                    speedIncrease.running = true
                    gearCalc()
                }
                onReleased: {
                    speedIncrease.running = false
                    speedDecrease.duration = decelerateDuration  //after brakePedal is released, increase brake duration
                    speedDecrease.running = true
                }
            }
        }

//        Rectangle {
//            id: engineStarter
//            width: 25; height: 100
//            color: "red"
//            radius: 10
//            Label {
//                anchors.centerIn: parent
//                text: "1"; font.pixelSize: 20
//                color: "black"
//            }
//            MouseArea {
//                id: mAreaEngineStart
//                anchors.fill: parent
//                onClicked: {
//                    engineStarter.color = "lightgreen";
//                    timerHome.timerStart();
//                    fuelData.timerStart();
//                    homeStatus.status_info = "Engine\nStarted"
//                }
//            }
//        }
//        Rectangle {
//            id: engineStopper
//            width: 25; height: 100
//            color: "red"
//            radius: 10
//            Label {
//                anchors.centerIn: parent
//                text: "0"; font.pixelSize: 20
//                color: "black"
//            }
//            MouseArea {
//                id: mAreaEngineStop
//                anchors.fill: parent
//                onClicked: {
//                    engineStopper.color = "lightgreen";
//                    timerHome.timerStop();
//                    fuelData.timerStop();
//                    homeStatus.status_info = "Engine\nStopped"
//                }
//            }
//        }
    }


    // Speed Animation (might require quadratic function to produce a smoother result)
    NumberAnimation on speed {
        id: speedIncrease
        running: false
        from: speed
        to: maxSpeed
        duration: accelerateDuration
    }
    NumberAnimation on speed {
        id: speedDecrease
        running: false
        from: speed
        to: 0
        duration: decelerateDuration
    }

}
