import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    anchors.centerIn: parent

    property var user: ""

    Label {
        id: welcomeText
        text: "Welcome " + user
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 22
        font.bold: false
        color: "#72d8f8"
    }

}
