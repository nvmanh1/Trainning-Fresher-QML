import QtQuick 2.0

Item {
    id: rectang
    Rectangle{

        width: 90
        height: 100
        color: ranColor
        border.color: "black"
        radius: 10
        Text {
            font.pixelSize: 40
            anchors.centerIn: parent
            text: ranVal.toString()
        }
    }
}
