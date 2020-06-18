import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    anchors.fill: parent

    Row {
        id: headlightsRow
        anchors.fill: parent

        Slider {
            id: sliderHeadlight
            orientation: Qt.Vertical
            width: 40; height: parent.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            value: 0.0; from: 0.0; to: 1.0
            snapMode: Slider.SnapAlways
            stepSize: 0.5

            onMoved: {
                if(value == 0.5) {
                    imgLowBeam.opacity = 1.0
                    imgHighBeam.opacity = 0.2
                }
                else if(value == 1.0) {
                    imgLowBeam.opacity = 0.2
                    imgHighBeam.opacity = 1.0
                }
                else {
                    imgLowBeam.opacity = 0.2
                    imgHighBeam.opacity = 0.2
                }
            }
        }

        Image {
            id: imgLowBeam
            source: "qrc:/images/images/headlightLowBeam.png"
            width: 50; height: 50
            anchors.right: parent.right
            anchors.rightMargin: 140
            anchors.verticalCenter: parent.verticalCenter
            opacity: 0.2
        }

        Image {
            id: imgHighBeam
            source: "qrc:/images/images/headlightHighBeam.png"
            width: 50; height: 50
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.verticalCenter: parent.verticalCenter
            opacity: 0.2
        }
    } //Row (id: headlightsRow)


}
