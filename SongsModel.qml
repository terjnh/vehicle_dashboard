import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

ListModel {
    id: songsModel

    ListElement {
        item: 1
        author: "Taylor Swift"
        song: "Blank Space"
        audiofile: "qrc:/audio/audio/Taylor Swift - Blank Space.mp3"
    }
    ListElement {
        item: 2
        author: "Ed Sheeran"
        song: "Shape of You"
        audiofile: "qrc:/audio/audio/Ed-Sheeran_Shape-of-You.mp3"
    }
    ListElement {
        item: 3
        author: "Calum Scott"
        song: "You are the Reason"
        audiofile: "qrc:/audio/audio/Calum-Scott_You-are-the-reason.mp3"
    }

}
