//import related modules
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts
import qtquick1
import "MyScript.js" as MyScript
//window containing the application


ApplicationWindow {

    FontLoader {
        source: "JosefinSans-Regular.ttf"

    }
    visible: true
    Universal.theme: Universal.Dark
    Universal.accent: Universal.Violet


    title: qsTr("Canvas")
    width: 720
    height: 480

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
                    console.log(mouseX)

                }
            }
        }
    }
}
