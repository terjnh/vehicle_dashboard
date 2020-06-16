import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.3
import QtMultimedia 5.12
import QtQuick.Controls.Styles 1.4

Item {
    id: audiopage

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue


    Item {
        id: itemSongs
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
                    anchors.fill: songsSwipeView
                    color: "#273746"
                    property var progressVal: (playMusic.position / playMusic.duration).toFixed(2);

                    Column {
                        id: displayInfoCol
                        width: itemModelRect.width - 60; height: 300
                        anchors.horizontalCenter: itemModelRect.horizontalCenter
                        anchors.top: itemModelRect.top; anchors.topMargin: 60
                        spacing: 20

                        Label {
                            id: lblArtiste
                            width: 100; height: 30
                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                            color: "white"
                            text: "Artiste: " + author
                            font.pixelSize: 22
                        }
                        Label {
                            id: lblSongTitle
                            width: 100; height: 30
                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignHCenter; verticalAlignment: Text.AlignVCenter
                            color: "white"
                            text: "Song: " + song
                            font.pixelSize: 22
                        }
                    }
                    Row {
                        id: controlBtnRow
                        width: 330
                        height: 60
                        anchors.horizontalCenter: itemModelRect.horizontalCenter
                        anchors.bottom: itemModelRect.bottom; anchors.bottomMargin: 30
                        spacing: 10

                        AudioButton {
                            id: playButton
                            lblAudioBtn: "PLAY"
                            onClicked: {
                                playMusic.play()
                                console.log("playMusic Playing")
                            }
                        }
                        AudioButton {
                            id: pauseButton
                            lblAudioBtn: "PAUSE"
                            onClicked: {
                                playMusic.pause()
                                onStopped: console.log("playMusic Paused")
                            }
                        }
                        AudioButton {
                            id: stopButton
                            lblAudioBtn: "STOP"
                            onClicked: {
                                playMusic.stop()
                                onStopped: console.log("playMusic Stopped")
                            }
                        }
                    }

                    ProgressBar {
                        id: songProgressBar
                        width: itemSongs.width - 100
                        height: 60
                        anchors.horizontalCenter: itemModelRect.horizontalCenter
                        anchors.bottom: controlBtnRow.top; anchors.topMargin: 5
                        value: progressVal
                    }

                    Audio {
                        id: playMusic
                        source: audiofile
                    }
                } //Rectangle
            } //Repeater (id: repeater)
        } //SwipeView
    }
}

