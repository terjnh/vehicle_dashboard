import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Shapes 1.12

Shape {
    anchors.fill: parent
    opacity: 0.05
    ShapePath {
        strokeWidth: 0
        fillColor: "white"
        startX: 13; startY: 5
        PathLine { x: 37; y: 5 }
        PathArc { x: 38; y: 8; radiusX: 3; radiusY: 3;}
        PathLine { x: 32; y: 112 }
        PathArc { x: 27; y: 115; radiusX: 3; radiusY: 3; }
        PathLine { x: 23; y: 115 }
        PathArc { x: 18; y: 112; radiusX: 3; radiusY: 3; }
        PathLine { x: 12; y: 8 }
    }
}
