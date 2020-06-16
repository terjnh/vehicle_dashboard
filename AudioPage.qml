import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.3
import QtMultimedia 5.12

Item {
    id: audiopage

    //property var progressVal: (playMusic.position / playMusic.duration).toFixed(2);


    Item {
        id: itemSongs
        x: 123
        width: 600
        height: 400
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter


        SwipeView {
            id: songsSwipeView
            anchors.fill: parent
            clip: true



            Repeater {
                id: repeater
                model: SongsModel {}

                Rectangle {
                    id: itemModelRect
                    color: "gray"
                    property var progressVal: (playMusic.position / playMusic.duration).toFixed(2);

                    Label {
                        id: lblSinger
                        width: 100; height: 100
                        anchors.centerIn: parent
                        color: "white"
                        text: index
                    }
                    Button {
                        id: playButton
                        anchors.top: lblSinger.bottom
                        width: 100; height: 50
                        text: "Play"
                        onClicked: {
                            playMusic.play()
                            console.log("playMusic playing")
                        }
                    }
                    Button {
                        id: stopButton
                        anchors.top: lblSinger.bottom
                        anchors.left: playButton.right
                        anchors.leftMargin: 10
                        width: 100; height: 50
                        text: "Stop"
                        onClicked: {
                            playMusic.stop()
                        }
                    }

                    ProgressBar {
                        id: songProgressBar
                        width: itemSongs.width - 100
                        height: 60
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: playButton.top; anchors.topMargin: 5
                        value: progressVal
                    }

                    Audio {
                        id: playMusic
                        source: audiofile

                        onStopped: console.log("playMusic Stopped")
                        onPaused: console.log("playMusic Pause")
                    }
                } //Rectangle
            } //Repeater (id: repeater)
        } //SwipeView
    }


}

