import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4



Item {
    id: pillarVisuals
    width: parent.width; height: parent.height
    x: parent.x; y: parent.y

    BouncyRedBall { startX: 10; fallingDuration: 2500 }
    BouncyRedBall { startX: 40; fallingDuration: 2700 }
    BouncyRedBall { startX: 70; fallingDuration: 2900 }
    BouncyRedBall { startX: 100; fallingDuration: 3100 }
    BouncyRedBall { startX: 750; fallingDuration: 3300 }
    BouncyRedBall { startX: 780; fallingDuration: 3500 }
    BouncyRedBall { startX: 810; fallingDuration: 3700 }
    BouncyRedBall { startX: 840; fallingDuration: 3900 }
}
