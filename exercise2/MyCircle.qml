import QtQuick 2.0

Item {
    id: cir
    Rectangle{
        width: 100
        height: 100
        color: ranColor
        border.color: "black"
        radius: 100
        Text {
            font.pixelSize: 40
            anchors.centerIn: parent
            text: ranVal.toString()
        }
    }


}
