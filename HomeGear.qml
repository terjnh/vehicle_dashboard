import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    width: parent.width; height: parent.height

    property var gear_number: 0

    Column {
        width: parent.width; height: parent.height

        Label {
            id: lblGearNum
            width: 100; height: 70
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: gear_number.toString();
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 60
            font.family: "Bitstream Charter"
            color: "#72d8f8"
        }
        Label {
            width: 100; height: 20
            anchors.top: lblGearNum.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: lblGearNum.horizontalCenter
            text: "GEAR"; font.pixelSize: 16
            font.family: "Bitstream Charter"
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
