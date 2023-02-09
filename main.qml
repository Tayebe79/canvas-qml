//import related modules
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts
import qtquick1
import QtQuick.Dialogs
import Qt.labs.platform

import "MyScript.js" as MyScript

//window containing the application


ApplicationWindow {
    id: root

    property Rectangle1 selectedItem: null


//    FontLoader {
//            source: "qrc:/qtquick1/fonts/Font Awesome 6 Pro-Thin-100.otf"
//        }
//        FontLoader {
//            source: "qrc:/qtquick1/fonts/Font Awesome 6 Pro-Solid-900.otf"
//        }
        FontLoader {
            source: "qrc:/qtquick1/fonts/Font Awesome 6 Pro-Regular-400.otf"
        }
//        FontLoader {
//            source: "qrc:/qtquick1/fonts/Font Awesome 6 Pro-Light-300.otf"
//        }


    visible: true
    Universal.theme: Universal.Dark
    Universal.accent: Universal.Violet


    title: qsTr("Canvas")
    width: 720
    height: 480

//    Text {
//        id: sampleFont
//        text: "\uf2ed"
//        font.family: "fa-regular"
//        color: "white"
//        font.pixelSize: 25
//    }



    Item {
        property int clicker;
        clicker : 0
        id: mainRec
        anchors.fill: parent

        MouseArea {
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            anchors.fill: parent
            onClicked: {
                if (mouse.button === Qt.RightButton) {
                    console.log("right button clicked!")
                } else if (mouse.button === Qt.LeftButton) {
                    MyScript.createSpriteObjects(null,mouseX, mouseY);
                    root.selectedItem = MyScript.sprite;
                    console.log(mouseX)
                }
            }
        }
    }
}
