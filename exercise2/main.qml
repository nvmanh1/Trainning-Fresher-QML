import QtQuick 2.12
import QtQuick.Controls
import QtQuick.Window 2.12
import QtQuick.Layouts
Window {
    id: root
    width: 620
    height: 480
    visible: true
    title: qsTr("Hello World")
    property int number: 0
    property int countTime: 0
    property int ranBox: 0
    property string ranColor: "white"
    property int ranVal: 0



    Rectangle{
        id: rec
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 25
        width: 450
        height: 420
        color: "white"
        border.color: "black"

        Flickable {
            id: flick
            anchors.fill: parent
            contentWidth: 420
            contentHeight: shapeGrid.height
            clip: true


            ListModel {
                id: shapeModel
                ListElement{ _box: 0; _color: "red"; _value: 0}
            }


            Grid {
                id: shapeGrid
                width: 400
                columns: 4
                spacing: 8
                anchors.left: parent.left
                anchors.leftMargin: 10

                Repeater {
                    model: shapeModel
                    delegate: MyShape {
                        mBox: _box
                        mColor: _color
                        mVal: _value
                    }
                }
                add: Transition{
                    NumberAnimation{properties:"x,y"; easing.type: Easing.OutBounce }
                }
           }
        }

    }

    Rectangle{
        id: shape
        anchors.top: box.bottom
        anchors.topMargin: 30
        anchors.left: box.left
        width: 110
        height: 110
        color: "white"
        Connections{
            target: box
            onMyshapeChanged:{
                loadshape.sourceComponent = compBoxShape
                console.log("idx:", box.myshape)
            }
        }

        Loader{
            id: loadshape
            anchors.fill: parent

        }
        Component {
            id: compBoxShape
            MyShape {
               // id: box
                mBox: ranBox
                mVal: ranVal
                mColor: ranColor
            }
        }
    }

    ComboBox {
        id:box
        property int myshape: 0
        width: 90
        height: 30
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: rec.right
        anchors.leftMargin: 10
        model: ListModel {

             ListElement { text: "BOX" }
             ListElement { text: "TRIANGLE" }
             ListElement { text: "CIRCLE" }
         }
         onActivated: {
             box.myshape = currentIndex
             ranBox = currentIndex

             console.log("index: ", box.currentIndex )
             console.log("text: ", box.currentIndex)
         }
     }

    Mybutton{
        id: button
        anchors.top: shape.bottom
        anchors.topMargin: 50
        anchors.left: rec.right
        anchors.leftMargin: 15
        onMyIndexChanged: {
            if(myIndex === 0)
            {
                time.start()
                loadshape.sourceComponent = compBoxShape
                console.log("ran box: ", ranBox)

            }
            else if(myIndex === 1)
            {


            }
            else if(myIndex === 2)
            {
               shapeModel.append({_box: ranBox, _color: ranColor, _value: ranVal })
                console.log("ContentY", flick.contentY)
               if((flick.contentHeight - 400) > 0)
               {
                   flick.contentY = flick.contentHeight - 400
               }

            }
            else if(myIndex === 3)
            {
                shapeModel.clear()
            }
        }
    }
    Timer{
        id: time
        interval: 100
        repeat: true
       // running: true
        onTriggered: {
            countTime++
        }
    }
    onCountTimeChanged:{
        console.log("countTime: ", countTime)
        root.ranBox = Math.random() * 3;
        root.ranVal = Math.random() * 100;
        root.ranColor = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);

        if(countTime === 20)
        {
            countTime = 0;
            time.stop()
        }
    }
    onRanBoxChanged: {
        box.myshape = ranBox
        console.log(ranBox)

    }



}
