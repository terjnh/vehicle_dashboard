import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4

Button {
    property alias lblAudioBtn: lblAudioBtn.text

    highlighted: true
    width: 100; height: 50
    background: Rectangle {
        color: "#607D8B"
        border.width: 2
        border.color: "#9E9E9E"
        radius: 6
        Label {
            id: lblAudioBtn
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Default"; font.pixelSize: 12
            font.bold: true;
        }
    }

}

