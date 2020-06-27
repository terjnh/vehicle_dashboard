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
            value: 0.05

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
            opacity: homeIgnition.engineState == "ON" ? 0.7 : 0.2
//            Label {
//                anchors.centerIn: parent
//                text: "S"; font.pixelSize: 40
//                color: "black"
//            }
            Image {
                anchors.centerIn: parent
                width: 55; height: 60
                source: "qrc:/images/images/brakeIcon.png"
            }

            MouseArea {
                anchors.fill: parent
                onPressAndHold: {
                    speedDecrease.running = false
                    speedDecrease.duration = 2000
                    speedDecrease.running = true
                    brakePedal.color = "#ff4b4b"; brakePedal.opacity = 0.6
                }
                onReleased: {
                    brakePedal.color = "white"; brakePedal.opacity = 0.7
                }
            }
        }

        Rectangle {
            id: acceleratePedal
            width: 60; height: 100
            radius: 10
            opacity: homeIgnition.engineState == "ON" ? 0.7 : 0.2
            Image {
                anchors.centerIn: parent
                width: 50; height: 70
                source: "qrc:/images/images/gasPedal.png"
            }

            MouseArea {
                anchors.fill: parent
                enabled: homeIgnition.engineState == "ON" ? true : false
                onPressAndHold: {
                    speedDecrease.running = false
                    speedIncrease.running = true
                    gearCalc()
                    acceleratePedal.color = "lightgreen"; acceleratePedal.opacity = 0.6
                }
                onReleased: {
                    speedIncrease.running = false
                    speedDecrease.duration = decelerateDuration  //after brakePedal is released, increase brake duration
                    speedDecrease.running = true
                    acceleratePedal.color = "white"; acceleratePedal.opacity = 0.7
                }
            }
        } //Rectangle(id: acceleratePedal)

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
