//import related modules
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import qtquick1
import "MyScript.js" as MyScript
//window containing the application


ApplicationWindow {

    FontLoader {
        source: "JosefinSans-Regular.ttf"
        Component.onCompleted: console.log("lodead")
    }
    visible: true
    Material.theme: Material.Dark
    Material.accent: Material.Purple


    title: qsTr("Canvas")
    width: 720
    height: 480




    Rectangle {
        id: mainRec
        Component.onCompleted: MyScript.createSpriteObjects();
        color: "black"
        anchors.fill: parent


    }


}
