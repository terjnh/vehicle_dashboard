import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2

import com.company.backend 1.0

Item {
    id: testpage

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
        anchors.verticalCenterOffset: -127
        anchors.horizontalCenterOffset: -196
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
        text: "Save to JSON"

        property var data: {
                "user": "",
                "info": {
                    "age": "",
                    "occupation": ""
                }
        }
        x: 79
        y: 189
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

    Column {
        id: colSwipeView
        x: 336
        width: 269; height: 80
        anchors.right: parent.right; anchors.rightMargin: 35
        anchors.top: parent.top; anchors.topMargin: 157

        ListView {
            snapMode: ListView.SnapOneItem
            highlightRangeMode: ListView.ApplyRange
            orientation: ListView.Vertical

            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            model: SongsModel {}

            delegate: Page {
                id: listDelegate
                width:  ListView.view.width
                height: 100

                Rectangle {
                    width: 150
                    height: 80
                    color: "yellow"

                    Text {
                        anchors.centerIn: parent
                        text: author
                    }

                    MouseArea {
                        id: delegateMArea
                        anchors.fill: parent
                        onClicked: {
                            console.log(item)
                        }
                    }
                }
            }
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
