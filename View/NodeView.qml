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

    readonly property bool isSelected: node.isSelected

    onIsSelectedChanged:  {
        if (isSelected)
            textInput1.forceActiveFocus()
    }


    Behavior on opacity { NumberAnimation {}}
    opacity: isSelected ? 1 : 0.4

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

        TextArea {
            id: textInput1
            focus: true
            placeholderText: qsTr("Enter description")
            color: "white"
            selectByMouse: true
            text: node.contentText
            background: Rectangle {
                color: "transparent";
            }

            onActiveFocusChanged:
                if (activeFocus)
                    root.selectedItem = textRec
        }
    }


    Rectangle {
        id: toolsItem
        radius: 5
        height: 34
        width: layout.implicitWidth + 4
        border.color: "#363636"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.top
        anchors.bottomMargin: 5
        opacity: isSelected ? 1 : 0.0
        color: "#1e1e1e"

        RowLayout {
            id: layout
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 3

            MButton {
                id: colorButton1

                property int clicker:0
                Layout.preferredHeight: 30
                Layout.preferredWidth: 30
                Layout.topMargin: 2
                Layout.bottomMargin: 2
                text: "\uf53f"

                onClicked: {
                    //                popup2.open()
                    tangle.visible = true
                }
                onDoubleClicked: {
                    tangle.visible = false
                }

            }

            MButton {
                text: "\uf24d"
                Layout.preferredHeight: 30
                Layout.preferredWidth: 30
                Layout.topMargin: 2
                Layout.bottomMargin: 2
                id: duplicateButton
            }

            MButton {
                text: "\uf30d"
                Layout.preferredHeight: 30
                Layout.preferredWidth: 30
                Layout.topMargin: 2
                Layout.bottomMargin: 2
                id: lockButton
                onClicked:{
                    textInput1.readOnly = true
                }
                onDoubleClicked:{
                    textInput1.readOnly = false
                }
            }


            MButton {
                id: deleteButton
                text: "\uf2ed"
                Layout.preferredHeight: 30
                Layout.preferredWidth: 30
                Layout.topMargin: 2
                Layout.bottomMargin: 2
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


        ColorPicker {
            id: tangle
            anchors.top: toolsItem.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: toolsItem.horizontalCenter
            visible: false

            onColorChanged: (colorName)=> {
                node.color = colorName
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

    TapHandler {
        id: tapHandler
//        gesturePolicy: TapHandler.ReleaseWithinBounds
        onTapped: {
            console.log("tapped!")
            root.selectedItem = textRec
        }
    }


}

