import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4



Item {
    id: itemAniVisualLeft
    width: parent.width; height: parent.height
    x: parent.x; y: parent.y

    BouncyRedBall {}
    BouncyRedBall { startX: 55 }
    BouncyRedBall { startX: 105 }

}
