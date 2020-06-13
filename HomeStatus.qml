import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    width: parent.width; height: parent.height

    property alias status_info: lblStatus.text

    Rectangle {
        id: rectStatus
        anchors.fill: parent
        anchors.centerIn: parent
        width: parent.width; height: parent.height
        border.width: 6
        radius: 20
        border.color: "#72d8f8"
        color: "transparent"
        Label {
            id: lblStatus
            width: parent.width; height: parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Status"
            font.pixelSize: 20
            color: "#2eff00"
        }
    }
}
