import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal

Rectangle {
    id: textRec
    radius:10
    width: 250
    height: 140
    color: "transparent"
    border.width : 3
    border.color: "purple"

    function hi (){
        textInput1.forceActiveFocus()
    }



    Behavior on opacity { NumberAnimation {}}
    opacity: textInput1.activeFocus ? 1 : 0.4


    MouseArea {
        hoverEnabled: true
        anchors.fill: parent
        drag.target: textRec
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.minimumY: 0
    }

    ScrollView{


        id: view
        anchors.fill: parent
        anchors.margins: 5
        ScrollBar.vertical.width: 5
        ScrollBar.horizontal.height: 5
        Item{

        }

        TextArea {
            id: textInput1
            focus: true
            placeholderText: qsTr("Enter description")
            color: "white"
            background: Rectangle {
                color: "transparent";
            }
        }

    }


    Component.onCompleted:{
        textInput1.forceActiveFocus()
    }


}

