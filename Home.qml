import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

import com.company.timer 1.0
import com.company.fueldata 1.0

Item {
    id: homepage

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    // C++ Timer Class
    Timer { id: timerHome }
    FuelData { id: fuelData }

    Column {
        id: colTitle
        x: 0
        width: 640; height: 50
        anchors.top: parent.top; anchors.topMargin: 250
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        Intro { id: introItem }  // Ask for Name, before fading out
    }

    Column {
        id: colFuel
        width: 200; height: 352
        anchors.left: parent.left; anchors.leftMargin: 60
        anchors.top: rowSpeed.top; anchors.topMargin: 0
        HomeFuelGauge {
            id: fuelgauge;
            anchors.fill: parent; visible: false
        }
    }

    Column {
        id: colWelcome
        width: 350
        height: 36
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 100
        anchors.bottom: parent.bottom
        HomeWelcome {
            id: welcomeLabel; anchors.fill: parent; visible: false;
            user: introItem.username
        }
    }

    Row {
        id: rowSpeed
        x: -10
        y: 580
        width: colWelcome.width - 100;
        height: 350
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top; anchors.topMargin: 50
        HomeSpeed {
            id: speedDisplay;
            anchors.fill: parent; visible: false;
        }
    }

    Column {
        id: colDistance
        width: rowSpeed.width
        height: 50
        anchors.top: rowSpeed.bottom
        anchors.horizontalCenter: rowSpeed.horizontalCenter
        HomeDistance {
            id: homeDistance; visible: false;
        }
    }

    Column {
        id: colGear
        width: 100; height: 150
        anchors.right: rowSpeed.left
        anchors.verticalCenter: rowSpeed.verticalCenter
        HomeGear {
            id: homeGear; anchors.fill: parent; visible: false;
            gear_number: speedDisplay.gearNum
        }
    }

    Column {
        id: colSaveLoad
        y: 378
        width: 110
        height: 100
        anchors.bottom: colWelcome.bottom; anchors.bottomMargin: 10
        anchors.left: colFuel.left
        HomeSaveLoad {
            id: homeSaveLoad; visible: false;
            nameData: welcomeLabel.user;
            distanceData: timerHome.distanceTotal;
            fuelValue: fuelData.fuelValue;
        }
    }

    Column {
        id: colTemperature
        width: colStatus.width; height: 100
        anchors.horizontalCenter: colStatus.horizontalCenter
        anchors.top: colStatus.bottom;
        anchors.topMargin: 2
        HomeTemperature {
            id: homeTemperature
            visible: false
            //temperatureValue
        }
    }

    Column {
        id: colStatus
        width: 200
        height: 110
        anchors.left: rowSpeed.right
        anchors.leftMargin: 120
        anchors.top: rowSpeed.top
        anchors.topMargin: 0
        HomeStatus {
            id: homeStatus; visible: false;
        }
    }

    Column {
        id: colIgnition
        x: 645
        y: 800
        width: 160
        height: 100
        anchors.bottom: rowSpeed.bottom
        anchors.bottomMargin: 30
        anchors.left: rowSpeed.right
        anchors.leftMargin: -60
        HomeIgnition {
            id: homeIgnition; visible: false;
        }
    }


    Column {
        id: colMisc
        width: colStatus.width
        height: 350
        anchors.top: colTemperature.bottom
        anchors.left: colIgnition.right
        anchors.leftMargin: 40
        HomeMisc {
            id: homeMisc; visible: false;
        }
    }









}

/*##^##
Designer {
    D{i:0;autoSize:true;height:640;width:960}D{i:1;anchors_y:215}D{i:5;anchors_y:20}D{i:7;anchors_x:239}
}
##^##*/
