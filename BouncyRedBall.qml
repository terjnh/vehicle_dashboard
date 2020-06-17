import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Rectangle {

    property var startX: pillarVisuals.x
    property var startY: pillarVisuals.height - ballWidth
    property var endY: 1
    property var ballWidth: 30
    property var ballHeight: ballWidth
    property var fallingDuration: 3000

    id: bouncyBallRed
    x: startX; y: parent.height - ballHeight
    width: ballWidth; height: 30
    radius: width / 2
    color: "red"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            objRiseFallAni.running = true
        }
    }

    SequentialAnimation {
        id: objRiseFallAni
        running: true
        loops: Animation.Infinite
        NumberAnimation { target: bouncyBallRed; property: "y"; from: startY; to: endY; duration: 1000; easing.type: Easing.OutSine; }
        NumberAnimation { id: fallAni; target: bouncyBallRed; property: "y"; from: endY; to: startY; duration: fallingDuration; easing.type: Easing.OutBounce;}
    }
}
