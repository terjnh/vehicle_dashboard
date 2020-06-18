import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    width: parent.width; height: parent.height

    property alias status_info: lblStatus.text
    property alias status_info_size: lblStatus.font.pixelSize
    property alias animateStatus: aniStatusChange.running

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

    SequentialAnimation {
        id: aniStatusChange
        running: false
        loops: 3
        NumberAnimation { target: lblStatus; property: "opacity"; from: 1.0; to: 0.2; duration: 600 }
        NumberAnimation { target: lblStatus; property: "opacity"; from: 0.2; to: 1.0; duration: 600 }
    }
}
