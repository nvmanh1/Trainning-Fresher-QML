import QtQuick 2.0
import QtQuick.Shapes 1.3

Item {
    id: shape

    Shape {
        id: shape1
        width: 90
        height: 100
        anchors.fill: parent
        ShapePath {
            strokeWidth: 2
            strokeColor: "black"
            fillColor: "red"
            strokeStyle: ShapePath.SolidLine
            startX: shape.width/2
            startY: 0
            PathLine { x: shape.width; y: shape.height }
            PathLine { x: 0; y: shape.height }
            PathLine { x: shape.width/2; y: 0 }
        }
        Text {
            font.pixelSize: 40
            anchors.centerIn: parent
            text: ranVal.toString()
            anchors.bottom: parent.bottom
        }
    }
}

