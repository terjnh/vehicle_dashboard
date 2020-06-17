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
    Column {
        id: colVisualLeft
        width: 150; height: 450
        x: 20; y: 20
        BouncyRedBallColumn {}
    }


    // Right Pillar
//    Item {
//        id: itemAniVisualRight
//        width: 150; height: 450
//        anchors.top: colVisualLeft.top; x: itemSongs.width + colVisualLeft.width + (colVisualLeft.x * 2)
//    }



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
                    color: "#474747"; opacity: 0.8
                    radius: 20
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
                        AudioLabel {
                            id: lblMusicPlayStatus;
                            visible: false
                            text: "Track Playing"
                            font.pixelSize: 16; color: "yellow"
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
                            enabled: true
                            lblAudioBtn: "PLAY"
                            onClicked: {
                                playMusic.play()
                                lblMusicPlayStatus.visible = true
                                playButton.enabled = false; pauseButton.enabled = true; stopButton.enabled = true
                                console.log("playMusic Playing")
                            }
                        }
                        AudioButton {
                            id: pauseButton
                            enabled: false
                            lblAudioBtn: "PAUSE"
                            onClicked: {
                                playMusic.pause()
                                lblMusicPlayStatus.visible = false
                                playButton.enabled = true; pauseButton.enabled = false; stopButton.enabled = true
                                onStopped: console.log("playMusic Paused")
                            }
                        }
                        AudioButton {
                            id: stopButton
                            enabled: false
                            lblAudioBtn: "STOP"
                            onClicked: {
                                playMusic.stop()
                                lblMusicPlayStatus.visible = false
                                stopButton.enabled = false; pauseButton.enabled = false; playButton.enabled = true
                                onStopped: console.log("playMusic Stopped")
                            }
                        }
                    }

//                    ProgressBar {
//                        id: songProgressBar
//                        width: itemSongs.width - 100
//                        height: 60
//                        anchors.horizontalCenter: itemModelRect.horizontalCenter
//                        anchors.bottom: controlBtnRow.top; anchors.topMargin: 5
//                        value: progressVal
//                    }

                    Slider {
                        id: trackSlider
                        width: itemSongs.width - 100
                        height: 60
                        anchors.horizontalCenter: itemModelRect.horizontalCenter
                        anchors.bottom: controlBtnRow.top; anchors.topMargin: 100
                        value: progressVal

                        onMoved: {
                            if(playMusic.seekable){
                                value = position
                                playMusic.seek(position * playMusic.duration)
                            }
                        }
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

