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
        width: 100; height: 205
        anchors.left: parent.left; anchors.leftMargin: 20;
        anchors.top: parent.top; anchors.topMargin: 20;

        HomeFuelGauge { id: fuelgauge; visible: false }
    }

    Column {
        id: colWelcome
        width: 350
        height: 36
        anchors.top: colFuel.top
        anchors.topMargin: 0
        anchors.left: colFuel.right
        anchors.leftMargin: 100

        HomeWelcome {
            id: welcomeLabel; visible: false;
            user: introItem.username
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_y:215}D{i:5;anchors_y:20}
}
##^##*/
