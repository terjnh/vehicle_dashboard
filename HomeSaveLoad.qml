import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2

import com.company.backend 1.0

Item {
    anchors.fill: parent

    // WRITE
    property var jsonString: ""
    property var nameData: ""
    property var distanceData: ""
    property var fuelValue: ""

    // READ
    property var loadedJsonString: ""
    property var nameString: ""
    property var distanceString: ""
    property var fuelString: ""

    Column {
        anchors.fill: parent
        spacing: 4
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Vehicle Config"
        }

        Button {
            id: btnSave
            width: 100; height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Save"

            property var information: {"name": "", "info": {"distance": "", "fuel": ""}}

            onClicked: {
                information.name = nameData
                information.info.distance = distanceData
                information.info.fuel = fuelValue

                var jsonData = JSON.stringify(information, null, "\t")
                jsonString = jsonData
                saveDialog.open()
            }
        }
        Button {
            id: btnLoad
            width: 100; height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Load"
            onClicked: {
                loadDialog.open()
                homeStatus.status_info = "Config\nLoaded"
            }
        }
    }

    // Backend C++ Object
    Backend {
        id: backend
        onPathChanged: console.log("Path: ", path)
        onDataChanged: console.log("Data: ", data)
    }

    // QtQuick.Dialogs
    FileDialog {
        id: saveDialog
        title: "Choose save location.."
        folder: shortcuts.desktop
        selectMultiple: false; selectExisting: false
        onAccepted: {
            backend.path = saveDialog.fileUrl
            backend.data = jsonString
        }
    }
    FileDialog {
        id: loadDialog
        title: "Please choose config file.."
        folder: shortcuts.desktop
        selectMultiple: false; selectExisting: true
        onAccepted: {
            backend.path = loadDialog.fileUrl
            loadedJsonString = backend.data  // load entire JSON string into 'loadedJsonString'
            var JsonObject = JSON.parse(loadedJsonString)
            nameString = JsonObject.name
            distanceString = JsonObject.info.distance;
            fuelString = JsonObject.info.fuel

            // Set loaded json data into Timer.h class -> m_dist
            timerHome.distanceTotal = distanceString
            fuelData.fuelValue = fuelString
            welcomeLabel.user = nameString
        }
    }

}
