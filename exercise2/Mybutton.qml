import QtQuick 2.0

Item {
    id: item
    property int myIndex: -1
    ListModel{
        id: modelBut
        ListElement{
            name: "GENERATE"
            cost: 4
        }
        ListElement{
            name: "Add by CPP"
            cost: 4
        }
        ListElement{
            name: "Add by Qml"
            cost: 4
        }
        ListElement{
           name: "CLEAR"
           cost: 4
        }
    }
    Component{
        id: viewBut
        Rectangle{
            id: recBut
            width: 80
            height: 30
            color: "grey"
            Text{
                anchors.centerIn: parent
                color: "black"
                font.pixelSize: 12
                text: name
            }
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    recBut.color = "darkseagreen"
                    listBut.currentIndex = index
                    myIndex = listBut.currentIndex
                    console.log("myIndex: ", myIndex)
                }
                onReleased: {
                    myIndex = -1
                    recBut.color = "grey"
                }
            }

        }
    }
    ListView{
        id: listBut
        spacing: 20
        width: 80
        height: 200
        model: modelBut
        delegate: viewBut
        currentIndex: -1
    }

}
