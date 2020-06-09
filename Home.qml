import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    id: homepage

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    property alias intro: introItem

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
        anchors.left: parent.left; anchors.leftMargin: 20;
        anchors.top: parent.top; anchors.topMargin: 20;

        HomeFuelGauge { id: fuelgauge; anchors.fill: parent; visible: false }
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
        width: colWelcome.width; height: 300
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top; anchors.topMargin: 80

        HomeSpeed { id: speedDisplay; anchors.fill: parent; visible: false; }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:640;width:960}D{i:1;anchors_y:215}D{i:5;anchors_y:20}D{i:7;anchors_x:239}
}
##^##*/
