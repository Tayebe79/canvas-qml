import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import qtquick1
import QtQuick.Dialogs
import "MyScript.js" as MyScript

Rectangle {
    id: textRec
    radius:10
    width: 250
    height: 140
    color: "transparent"
    border.width : 3
    border.color: "purple"

    readonly property bool isSelected: textRec === root.selectedItem

    onIsSelectedChanged:  {
        if (isSelected)
            textInput1.forceActiveFocus()
    }


    Behavior on opacity { NumberAnimation {}}
    opacity: isSelected ? 1 : 0.4

    Item {
        id: toolsItem
        height: 40
        width: 120
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.top
        anchors.bottomMargin: 5
        opacity: isSelected ? 1 : 0.0

        MButton {
            id: colorButton
            text: "\uf53f"
            anchors.right: etcButton.left
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                colorDialog.open()
            }
            Text {
                text: "HHHHHHHHH"
                color: colorDialog.currentColor
            }

            ColorDialog {
                id: colorDialog
                title: "Please choose a color"
                onAccepted: {
                    console.log("You chose: " + colorDialog.color)

                }
                onRejected: {
                    console.log("Canceled")

                }
            }

        }

        MButton {
            id: etcButton
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MButton {
            id: deleteButton
            anchors.left: etcButton.right
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                popup1.open()
            }
            Popup {
                   id: popup1
                   parent: Overlay.overlay
                   x: Math.round((parent.width - width) / 2)
                   y: Math.round((parent.height - height) / 2)
                   width: 300
                   height: 150
                   padding: 30
                   modal: true
                   focus: true
                   Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        Text {
                            text: qsTr("Are you sure you want to delete this item?")
                            font.pointSize: 10
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.top: parent.top
                        }
                        Button {
                            id: yesbutton
                            width: 60
                            anchors.left: parent.left
                            anchors.bottom: parent.bottom
                            text: qsTr("Yes")
                            onClicked: {
                                popup1.close()
                                textRec.destroy()
                            }
                        }
                        Button {
                            id: nobutton
                            width: 60
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            text: qsTr("No")
                            onClicked: {
                                popup1.close()
                            }
                        }
                    }
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
            }
        }
    }

    MouseArea {
        hoverEnabled: true
        anchors.fill: parent
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
        Item{

        }

        TextArea {
            id: textInput1
            focus: true
            placeholderText: qsTr("Enter description")
            color: "white"
            selectByMouse: true
            background: Rectangle {
                color: "transparent";
            }

            onActiveFocusChanged:
                if (activeFocus)
                    root.selectedItem = textRec
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

    TapHandler {
        id: tapHandler
//        gesturePolicy: TapHandler.ReleaseWithinBounds
        onTapped: {
            console.log("tapped!")
            root.selectedItem = textRec
        }
    }


}

