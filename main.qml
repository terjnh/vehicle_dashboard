import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

ApplicationWindow {
    visible: true
    width: 960
    height: 640
    title: qsTr("Dashboard")

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Home {
        }

        Audio {
        }

    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Home")
        }

        TabButton {
            text: qsTr("Audio")
        }

    }
}
