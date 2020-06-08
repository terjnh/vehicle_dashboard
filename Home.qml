import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    id: element

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    Column {
        id: colTitle
        x: 0
        width: 640
        height: 50
        anchors.top: parent.top
        anchors.topMargin: 250
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter


        /*** Intro Label and Text Input Field ***/
        Label {
            id: lblTitle
            text: qsTr("Please Enter your Name:")
            anchors.left: parent.left
            anchors.leftMargin: 100
            font.pointSize: 16
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField {
            id: tfTitle
            width: 200
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: lblTitle.right
            anchors.leftMargin: 20
            font.pointSize: 16
            placeholderText: qsTr("Enter Here")

            focus: true
            Keys.onReturnPressed: {
                console.log("Name entered")
                introFadeOut.running = true
            }
        }
        ParallelAnimation {
            id: introFadeOut
            running: false
            OpacityAnimator { target: lblTitle; from: 1; to: 0; duration: 1000; }
            OpacityAnimator { target: tfTitle; from: 1; to: 0; duration: 1000; }
        } //ParallelAnimation



    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_y:215}
}
##^##*/
