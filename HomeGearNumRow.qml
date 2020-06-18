import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item {
    anchors.fill: parent

    function gearNumNeutral() {
        if(speedDisplay.dialSpeedValue < 0.01){
            lblNeutral.opacity = 1.0
        } else {
            lblNeutral.opacity = 0.2
        }
        return lblNeutral.opacity
    }
    function gearNumOne() {
        if(speedDisplay.dialSpeedValue >= 0.01 && speedDisplay.dialSpeedValue < 0.15){
            lblGearOne.opacity = 1.0
        } else {
            lblGearOne.opacity = 0.2
        }
        return lblGearOne.opacity
    }

    Row {
        anchors.fill: parent
        spacing: 0

        HomeGearLabel {
            id: lblNeutral; text: "N";
            opacity: (speedDisplay.dialSpeedValue < 0.01) ? 1.0 : 0.2
        }
        HomeGearLabel {
            id: lblGearOne; text: "1";
            opacity: (speedDisplay.dialSpeedValue >= 0.01 && speedDisplay.dialSpeedValue < 0.15) ? 1.0 : 0.2
        }
        HomeGearLabel {
            id: lblGearTwo; text: "2";
            opacity: (speedDisplay.dialSpeedValue >= 0.15 && speedDisplay.dialSpeedValue < 0.35) ? 1.0 : 0.2
        }
        HomeGearLabel {
            id: lblGearThree; text: "3";
            opacity: (speedDisplay.dialSpeedValue >= 0.35 && speedDisplay.dialSpeedValue < 0.55) ? 1.0 : 0.2
        }
        HomeGearLabel {
            id: lblGearFour; text: "4";
            opacity: (speedDisplay.dialSpeedValue >= 0.55 && speedDisplay.dialSpeedValue < 0.75) ? 1.0 : 0.2
        }
        HomeGearLabel {
            id: lblGearFive; text: "5";
            opacity: (speedDisplay.dialSpeedValue >= 0.75 && speedDisplay.dialSpeedValue < 1.00) ? 1.0 : 0.2
        }
    }
}
