import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    /*** Intro Label and Text Input Field ***/
    id: intro

    property alias username: tfTitle.text

    Label {
        id: lblTitle
        text: qsTr("Please Enter your Name:")
        color: "#72d8f8"
        anchors.left: parent.left; anchors.leftMargin: 100
        font.pointSize: 16
        anchors.verticalCenter: parent.verticalCenter
    }
    TextField {
        id: tfTitle
        width: 200
        height: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: lblTitle.right; anchors.leftMargin: 20
        font.pointSize: 16
        maximumLength: 8
        placeholderText: qsTr("Enter Here")

        focus: true
        Keys.onReturnPressed: {
            console.log("Name entered: " + tfTitle.text)
            introFadeOut.running = true
            fuelgauge.visible = true
            welcomeLabel.visible = true
            speedDisplay.visible = true
            homeGear.visible = true
            homeDistance.visible = true
            homeSaveLoad.visible = true
            homeStatus.visible = true
            homeIgnition.visible = true
            homeTemperature.visible = true
            homeMisc.visible = true
        }
    }
    ParallelAnimation {
        id: introFadeOut
        running: false
        OpacityAnimator { target: lblTitle; from: 1; to: 0; duration: 500; }
        OpacityAnimator { target: tfTitle; from: 1; to: 0; duration: 500; }
    } //ParallelAnimation
}
