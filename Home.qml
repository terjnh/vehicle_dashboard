import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    id: homepage

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    Column {
        id: colTitle
        x: 0
        width: 640; height: 50
        anchors.top: parent.top; anchors.topMargin: 250
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Intro { }  // Ask for Name, before fading out
    }

    Column {
        id: colFuel
        width: 100; height: 205
        anchors.left: parent.left; anchors.leftMargin: 20;
        anchors.top: parent.top; anchors.topMargin: 20;

        HomeFuelGauge { id: fuelgauge; visible: false }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_y:215}
}
##^##*/
