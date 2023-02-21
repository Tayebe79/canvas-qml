import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Universal
import qtquick1
import QtQuick.Dialogs

/*! ***********************************************************************************************
 * Node view is implemented here. Each node is represented with a scrollable rectangle. Text can
 * be typed in this rectangle. Each node is draggable. Click to select and drag, double click to
 * edit the text inside.
 * ************************************************************************************************/

Rectangle {
    id: textRec

    /* Property Declarations
         * ****************************************************************************************/
    property Node node
    property int tempX
    property int tempY
    property bool isSelected: node.isSelected
    property bool editMode: false
    property point beginDrag
    property bool caught: false
    property bool isDrag: false


    /* Object Style and sizing
         * ****************************************************************************************/
    radius:10
    width: node.width
    height: node.height
    x: node.x
    y: node.y
    color: "transparent"
    border.width : 3
    border.color: node.color
    opacity: isSelected ? 1 : 0.4
    //Animation style
    Behavior on opacity { NumberAnimation {}}
    Behavior on border.color{ColorAnimation{duration: 250}}


    //Scrollable rectangle with text inside
    ScrollView {
        id: view
        anchors.fill: parent
        anchors.margins: 5
        ScrollBar.vertical.width: 5
        ScrollBar.horizontal.height: 5

        //Text Area
        TextArea {
            id: textInput1
            placeholderText: qsTr("Enter description")
            color: "white"
            selectByMouse: true
            text: node.contentText
            onTextChanged: {
                if (node && node.contentText !== text)
                    node.contentText = text;
            }

            //background for textAre
            background: Rectangle {
                color: "transparent";
            }
        }
    }

    //Tool Buttons (color change, duplicate, lock text,)
    Rectangle{
        anchors.fill: parent
        color:"transparent"
        NodeTools{}
    }


    function update(){
        if(isDrag){
            node.x = x;
            node.y = y;
        }
    }
    onXChanged: {
        if(isDrag)
            update();
    }
    onYChanged: {
        if(isDrag)
            update();
    }

    //Dragging the cards
    MouseArea {
        enabled: !editMode
        anchors.fill: parent
        hoverEnabled: true
        //on click, the card is selected
        onClicked:{
            if(node){
                node.isSelected = true;
                nodeManager.selectItem(node.id)
            }
        }
        drag.target: parent
        //Dragging 1
        onPressed:{
            isDrag = true;
        }
//        //Dragging 3
        onReleased : {
            isDrag = false;
        }
        //Double click to edit text
        onDoubleClicked: {
            editMode = true
        }
    }
    //to disable edit mode once the card isn't selected
    onIsSelectedChanged:  {
        if (!isSelected)
            editMode = false;
    }

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

//        //Dragging 2
//        onPositionChanged: {
//            if (isDrag) {
//                node.x = (mouseX - textRec.beginDrag.x) + node.x
//                node.y = (mouseY - textRec.beginDrag.y) + node.y
//            }
//        }

