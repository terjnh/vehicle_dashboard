import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    width: parent.width; height: parent.height

    property alias animationTurnLeft: aniLeftTurnSignal.running
    property alias animationTurnRight: aniRightTurnSignal.running

    Row {
        id: turnsignalRow
        anchors.fill: parent
        Image {
            id: imageLeftSig
            height: 70; width: 70
            opacity: 0.2
            anchors.left: parent.left; anchors.leftMargin: 35
            source: "qrc:/images/images/turnSignalLeft.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    aniLeftTurnSignal.running = true
                    console.log("Left Turn Signal triggered")
                }
            } //MouseArea
        }
        Image {
            id: imageRightSig
            height: 70; width: 70
            opacity: 0.2
            anchors.right: parent.right; anchors.rightMargin: 40
            source: "qrc:/images/images/turnSignalRight.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    aniRightTurnSignal.running = true
                    console.log("Right Turn Signal triggered")
                }
            } //MouseArea
        }

        // Left Turn Signal Animation
        SequentialAnimation {
            id: aniLeftTurnSignal
            running: false
            loops: 20
            NumberAnimation { target: imageLeftSig; property: "opacity"; from: 0.2; to: 1; duration: 500 }
            NumberAnimation { target: imageLeftSig; property: "opacity"; from: 1; to: 0; duration: 300 }
            NumberAnimation { target: imageLeftSig; property: "opacity"; from: 0; to: 0.2; duration: 200 }
        }

        // Right Turn Signal Animation
        SequentialAnimation {
            id: aniRightTurnSignal
            running: false
            loops: 20
            NumberAnimation { target: imageRightSig; property: "opacity"; from: 0.2; to: 1; duration: 500 }
            NumberAnimation { target: imageRightSig; property: "opacity"; from: 1; to: 0; duration: 300 }
            NumberAnimation { target: imageRightSig; property: "opacity"; from: 0; to: 0.2; duration: 200 }
        }
    }
}
