import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Universal
import qtquick1
import QtQuick.Dialogs
//import "MyScript.js" as MyScript

Rectangle {

    id: textRec
    radius:10
    width: node.width
    height: node.height
    x: node.x
    y: node.y
    color: "transparent"
    border.width : 3
    border.color: node.color
    Behavior on border.color{ColorAnimation{duration: 250}}

    property Node node

    property bool isSelected: node.isSelected

    onIsSelectedChanged:  {
        if (isSelected)
            textInput1.forceActiveFocus()
    }


    Behavior on opacity { NumberAnimation {}}
    opacity: isSelected ? 1 : 0.4


    MouseArea {
        onClicked:{
            console.log("hi")
            if(node){
                node.isSelected = true;
                nodeManager.selectItem(node.id)

            }
        }

        anchors.fill: parent
        hoverEnabled: true
        drag.target: textRec
        drag.axis: Drag.XAndYAxis
        drag.minimumX: 0
        drag.minimumY: 0
    }




    ScrollView {
        id: view
        anchors.fill: parent
        anchors.margins: 5
        ScrollBar.vertical.width: 5
        ScrollBar.horizontal.height: 5

        TextArea {

            id: textInput1
//            focus: node.focusTracker
            placeholderText: qsTr("Enter description")
            color: "white"
            selectByMouse: true
            text: node.contentText

            onTextChanged: {
                if (node && node.contentText !== text)
                    node.contentText = text;
            }

//            onTextChanged1: {
//                textRec.textChanged1(textInput1.text)
//            }

            background: Rectangle {
                color: "transparent";
            }
//            onActiveFocusChanged:
//                if (activeFocus)
//                    root.selectedItem = textRec.selected
        }
    }

    Rectangle{
        anchors.fill: parent
        color:"transparent"
        NodeTools{}
    }


//    Component.onCompleted:{
//        textInput1.forceActiveFocus()
//    }


//    MouseArea {
//        anchors.fill: parent
//        propagateComposedEvents: true
//        onClicked: {
//            root.selectedItem = textRec
////            isSelected = true
//            mouse.accepted = true
////            console.log("hi");
////            MyScript.hi();

//        }
//    }

//    TapHandler {
//        id: tapHandler
////        gesturePolicy: TapHandler.ReleaseWithinBounds
//        onTapped: {
//            console.log("tapped!")
//            root.selectedItem = textRec
//        }
//    }


}

