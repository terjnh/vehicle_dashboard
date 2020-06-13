import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2

import com.company.backend 1.0

Item {
    id: audiopage

    property var jsonString: ""

    Backend {
        id: backend
        onPathChanged: console.log("Path: ", path)
        onDataChanged: console.log("Data: ", data)
    }

    FileDialog {
        id: saveDialog
        title: "Please choose where to save data"
        folder: shortcuts.desktop
        selectMultiple: false; selectExisting: false;

        onAccepted: {
            backend.path = saveDialog.fileUrl
            backend.data = jsonString
        }
    }


    Grid {
        id: grid
        width: 200
        height: 170
        anchors.centerIn: parent
        columns: 2
        spacing: 10
        Label {
            text: "Name: "
        }
        TextField {
            id: tfName
            placeholderText: "Input Name"
        }
        Label {
            text: "Age: "
        }
        TextField {
            id: tfAge
            placeholderText: "Input Age"
        }
        Label {
            text: "Occupation: "
        }
        TextField {
            id: tfOccupation
            placeholderText: "Input Occupation"
        }
    }

    Button {
        anchors.horizontalCenter: grid.horizontalCenter
        anchors.top: grid.bottom
        text: "Save to JSON"

        property var data: {
                "user": "",
                "info": {
                    "age": "",
                    "occupation": ""
                }
            }
        onClicked: {
            //var JsonObject = JSON.parse(data);

            // Store values into JSON objects
            data.user = tfName.text
            data.info.age = tfAge.text
            data.info.occupation = tfOccupation.text

            var jsonData = JSON.stringify(data, null, "\t")
            jsonString = jsonData

            console.log(jsonData)

            // Now we will want to pass jsonData to C++ class to save as a local .json file
            saveDialog.open()
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
