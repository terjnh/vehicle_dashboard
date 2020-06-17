import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Window 2.3
import QtMultimedia 5.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.12

Item {
    id: audiopage

    Material.theme: Material.Dark
    Material.accent: Material.LightBlue

    // Left Pillar
    Item {
        id: itemAniVisualLeft
        width: 150; height: 450
        x: 20; y: 20

        Rectangle {
            anchors.fill: parent
            color: "yellow"; opacity: 0.2
        }
    }


    // Right Pillar
    Item {
        id: itemAniVisualRight
        width: 150; height: 450
        anchors.top: itemAniVisualLeft.top; x: itemSongs.width + itemAniVisualLeft.width + (itemAniVisualLeft.x * 2)

        Rectangle {
            anchors.fill: parent
            color: "yellow"; opacity: 0.2
        }
    }



    Item {
        id: itemSongs
        width: 600
        height: 450
        anchors.top: parent.top; anchors.topMargin: 20
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

                        AudioLabel {
                            id: lblArtiste
                            text: "Artiste: " + author
                        }
                        AudioLabel {
                            id: lblSongTitle
                            text: "Song: " + song
                        }
                    }
                    Column {
                        id: volumeControlCol
                        width: 100; height: 60
                        anchors.left: displayInfoCol.right; anchors.leftMargin: -100
                        anchors.top: displayInfoCol.top; anchors.topMargin: -10
                        spacing: 8

                        // Custom Slider for Volume. Also can use AudioVolumeShape.qml
                        AudioCustomSlider {}

                        Label {
                            id: volStatus
                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "Volume: " + Math.round(playMusic.volume * 100 * 1 / 1)
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
                        volume: 0.5
                    }
                } //Rectangle
            } //Repeater (id: repeater)
        } //SwipeView
    }
}

