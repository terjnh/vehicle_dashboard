import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtGraphicalEffects 1.0

Item {
    width: parent.width; height: parent.height

    property alias engineOilIcon: engineOilIcon
    property alias batteryIcon: batteryIcon

    GridView {
        id: gridView
        visible: false  // Change to TRUE to see signals in Misc Container
        width: parent.width; height: parent.height / 4
        cellWidth: 100; cellHeight: 100

        model: IconsModel {}
        delegate: Column {
            Rectangle {
                id: gridRect
                width: 70
                height: 70
                color: "#303030"
                Image {
                    id: img; source: icon;
                    opacity: 0.2
                    anchors.horizontalCenter: parent.horizontalCenter;
                    fillMode: Image.PreserveAspectCrop;
                    height: 70; width: 70
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gridView.currentIndex = -1
                        console.log(gridView.currentIndex)
                        aniTurnSignal.running = true
                    }
                }
            }

            // Turn Signal Animation
            SequentialAnimation {
                id: aniTurnSignal
                running: false
                loops: 5
                NumberAnimation { target: img; property: "opacity"; from: 0.2; to: 1; duration: 500 }
                NumberAnimation { target: img; property: "opacity"; from: 1; to: 0; duration: 300 }
                NumberAnimation { target: img; property: "opacity"; from: 0; to: 0.2; duration: 200 }
            }
        } //delegate: Column
    }//GridView (id: gridView)

    Column {
        id: colMiddleRow
        anchors.top: gridView.bottom
        anchors.horizontalCenter: gridView.horizontalCenter
        width: parent.width; height: (parent.height / 4 * 3)
        Row {
            width: parent.width; height: parent.height / 4
            id: rowEngineBatteryIcons
            spacing: 38
            Image {
                id: engineOilIcon
                width: 70; height: 70
                source: "qrc:/images/images/engOil.png"
                opacity: (timerHome.distanceTotal > 1000) ? 1.0 : 0.2
                MouseArea {
                    anchors.fill: parent
                    onClicked: parent.opacity = 0.2
                }
            }

            Image {
                id: batteryIcon
                width: 60; height: 60
                source: "qrc:/images/images/battery.png"
                opacity: 0.2
            }
        }
    } //Column

    Column {

    }
}
