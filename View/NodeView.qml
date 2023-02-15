import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Universal
import qtquick1
import QtQuick.Dialogs


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

    property int tempX
    property int tempY

    property bool isSelected: node.isSelected
    property bool focusTracker: node.focusTracker

    property bool editMode: false

    property point beginDrag
    property bool caught: false
    property bool isDrag: false

    onIsSelectedChanged:  {
        if (!isSelected)
            editMode = false;
    }


    Behavior on opacity { NumberAnimation {}}
    opacity: isSelected ? 1 : 0.4


    ScrollView {
        id: view
        anchors.fill: parent
        anchors.margins: 5
        ScrollBar.vertical.width: 5
        ScrollBar.horizontal.height: 5

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


            background: Rectangle {
                color: "transparent";

            }
        }
    }

    Rectangle{
        anchors.fill: parent
        color:"transparent"
        NodeTools{}
    }

    MouseArea {
        enabled: !editMode
        anchors.fill: parent
        hoverEnabled: true
        onClicked:{
            if(node){
                node.isSelected = true;
                nodeManager.selectItem(node.id)
            }
        }
        onPressed:{
            isDrag = true;
            textRec.beginDrag = Qt.point(mouseX, mouseY);

        }
        onPositionChanged: {
            if (isDrag) {
                node.x = (mouseX - textRec.beginDrag.x) + node.x
                node.y = (mouseY - textRec.beginDrag.y) + node.y
            }
        }
        onReleased : {
            isDrag = false;
        }
        onDoubleClicked: {
            editMode = true
        }
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



