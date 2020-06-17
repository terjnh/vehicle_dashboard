import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Rectangle {

    property var startX: itemAniVisualLeft.x
    property var startY: itemAniVisualLeft.height - ballWidth
    property var endY: 1
    property var ballWidth: 30
    property var ballHeight: ballWidth

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
        running: false
        loops: 1
        NumberAnimation { target: bouncyBallRed; property: "y"; from: startY; to: endY; duration: 1000; easing.type: Easing.OutSine; }
        NumberAnimation { target: bouncyBallRed; property: "y"; from: endY; to: startY; duration: 3000; easing.type: Easing.OutBounce;}
    }
}
