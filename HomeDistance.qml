import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2

import com.company.timer 1.0
import com.company.backend 1.0

Item {
    anchors.fill: parent

    Row {
        width: parent.width; height: parent.height
        anchors.centerIn: parent

        Label {
            id: lblDistance
            anchors.centerIn: parent
            font.family: "Bitstream Charter"
            font.pixelSize: 28
            text: timerHome.distanceTotal + " m"
        }
    }
}
