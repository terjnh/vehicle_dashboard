import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

import com.company.timer 1.0

Item {
    anchors.fill: parent

    property var distanceTotal: 0

    Row {
        width: parent.width; height: parent.height
        anchors.centerIn: parent

        Label {
            id: lblDistance
            anchors.centerIn: parent
            font.family: "Bitstream Charter"
            font.pixelSize: 28
            text: "000000" + " m"
        }

    }

    // Timer C++ Class
    Timer {
        id: timer

        onDistanceChanged: {
            distanceTotal = timer.distanceTotal
            lblDistance.text = distanceTotal + " m"
            console.log(distanceTotal)
        }
    }
}
