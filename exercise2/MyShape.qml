import QtQuick 2.0
import QtQuick.Shapes 1.3
Item {
    width: 100
    height: 100
    property int mBox: 0
    property string mColor : "red"
    property int mVal: 0
    function createShape()
    {
        console.log("mBox: ", mBox)
           if(mBox == 0)
            {
                loadShape.sourceComponent = rec

            }
            else if(mBox == 1)
            {
                loadShape.sourceComponent = tri
            }
            else if(mBox == 2)
            {
                loadShape.sourceComponent = cir
            }
         //  loadShape.sourceComponent = rec
    }
    Loader{
        id: loadShape
        width: 100
        height: 100
    }
    Component{
        id: tri
        Shape {
            id: shape
            width: 100
            height: 100
//            anchors.centerIn: parent
//            anchors.fill: parent
            ShapePath {
                strokeWidth: 2
                strokeColor: "black"
                fillColor: mColor
                strokeStyle: ShapePath.SolidLine
                startX: shape.width/2
                startY: 0
                PathLine { x: shape.width; y: shape.height }
                PathLine { x: 0; y: shape.height }
                PathLine { x: shape.width/2; y: 0 }
            }
            Text {
                anchors.horizontalCenter: shape.horizontalCenter
                y: 30
                font.pixelSize: 35
                //anchors.centerIn: parent
                text: mVal.toString()
                //anchors.bottom: parent.bottom
            }
        }
    }
    Component{
        id: cir
        Rectangle{
//            anchors.fill: parent
            width: 100
            height: 100
            color: mColor
            border.color: "black"
            radius: 100
            Text {

                font.pixelSize: 35
                anchors.centerIn: parent
                text: mVal.toString()
            }
        }
    }
    Component{
         id: rec
        Rectangle{
//            anchors.fill: parent
            width: 100
            height: 100
            color: mColor
            border.color: "black"
            radius: 10
            Text {
                font.pixelSize: 35
                anchors.centerIn: parent
                text: mVal.toString()
            }
        }
    }
    Component.onCompleted:{
        createShape();
        console.log("ranbox", ranBox)
    }
    onMBoxChanged: {
        createShape();
    }

}
