import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {

    property alias temperatureValue: temperatureInfill.width

    width: parent.width; height: parent.height;

    Column {
        width: parent.width; height: parent.height;

        Rectangle {
            id: temperatureBorder
            anchors.top: parent.top; anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 20
            height: 50
            color: "transparent"
            border.color: "white"; border.width: 2
            radius: 10

            Rectangle {
                id: temperatureInfill
                anchors.left: parent.left; anchors.leftMargin: parent.border.width
                anchors.verticalCenter: parent.verticalCenter
                width: temperatureValue
                height: parent.height - (parent.border.width * 2)
                color: "red"
                radius: parent.radius
            }

            Label {
                id: lblTemperature
                anchors.fill: parent
                width: parent.width; height: parent.height
                color: "white"
                text: Math.round((30 + temperatureValue/3) * 1.0 / 1.0) + " °C"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }


}
