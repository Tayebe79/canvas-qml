import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Universal
import qtquick1
import QtQuick.Dialogs

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
                if(isSelected)
                    tangle.visible = true
            }
            onDoubleClicked: {
                if(isSelected)
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
                if(isSelected){
                    if(node){
                        node.justRead = true
                        textInput1.readOnly = node.justRead
                    }
                }
            }
            onDoubleClicked:{
                if(isSelected){
                    if(node){
                        node.justRead = false
                        textInput1.readOnly = node.justRead
                    }
                }
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
                if(isSelected)
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
                            popup1.close();
                            nodeManager.deleteNode(node.id);
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
