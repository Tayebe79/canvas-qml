//import related modules
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts
import qtquick1
import QtQuick.Dialogs
import Qt.labs.platform
import QtQuick.Window


//window containing the application


// tasks:
// - selectedItem/click/doubleClick
// 1- grids background (almost done)
// 2- Overview Item
// 3- Snaping feature
// 4- Port
// 5- scrollbar (done)
// 6- flickable (done)
// 7- dupliacate (done)

//problems: 1- text continue thingy 2- x and y after drag

ApplicationWindow {
//    flags: Qt.FramelessWindowHint
    id: root
        FontLoader {
            source: "qrc:/qtquick1/fonts/Font Awesome 6 Pro-Regular-400.otf"
        }

    visible: true
    Universal.theme: Universal.Dark
    Universal.accent: Universal.Violet
    title: qsTr("Canvas")
    width: 720
    height: 480
    color: "#1e1e1e"

    property NodeManager nodeManager: NodeManager {}

    SceneView {
        anchors.fill: parent
        nodeManager: root.nodeManager
    }

}
//        contentWidth: parent.width * 2
//        contentHeight: parent.height * 2

//        ScrollBar.horizontal: ScrollBar {
//            id: hbar;
//            active: vbar.active
//            anchors.margins: 5
//            height: 5
//        }
//        ScrollBar.vertical: ScrollBar {
//            id: vbar;
//            active: hbar.active
//            anchors.margins: 5
//            width: 5
//        }



//    Item {
//        property int clicker;
//        clicker : 0
//        id: mainRec
//        anchors.fill: parent

//        MouseArea {
//            acceptedButtons: Qt.LeftButton | Qt.RightButton
//            anchors.fill: parent
//            onClicked: {
//                if (mouse.button === Qt.RightButton) {
//                    console.log("right button clicked!")
//                } else if (mouse.button === Qt.LeftButton) {
////                    MyScript.createSpriteObjects(null,mouseX, mouseY);
////                    root.selectedItem = MyScript.sprite;
////                    console.log(mouseX)
//                }
//            }
//        }
//    }

//    Rectangle {
//        id: page
//        width: 320; height: 480
//        color: "lightgray"

//        Text {
//            id: helloText
//            text: "Hello world!"
//            y: 30
//            anchors.horizontalCenter: page.horizontalCenter
//            font.pointSize: 24; font.bold: true
//        }

//        Grid {
//            id: colorPicker
//            x: 4; anchors.bottom: page.bottom; anchors.bottomMargin: 4
//            rows: 2; columns: 3; spacing: 3

//            Cell { cellColor: "red"; onClicked: helloText.color = cellColor }
//            Cell { cellColor: "green"; onClicked: helloText.color = cellColor }
//            Cell { cellColor: "blue"; onClicked: helloText.color = cellColor }
//            Cell { cellColor: "yellow"; onClicked: helloText.color = cellColor }
//            Cell { cellColor: "steelblue"; onClicked: helloText.color = cellColor }
//            Cell { cellColor: "black"; onClicked: helloText.color = cellColor }
//        }
//    }



//    Text {
//        id: sampleFont
//        text: "\uf2ed"
//        font.family: "fa-regular"
//        color: "white"
//        font.pixelSize: 25
//    }

