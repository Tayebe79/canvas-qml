import QtQuick
import QtQuick.Controls

ToolButton {
    id: control
//    width: 120
    width: 30
    height: 30
    text: "\uf2ed"
    font.family: "fa-regular"
//    color: "white"
    font.pixelSize: 15

//    contentItem: Text {
//        text: control.text
//        font: control.font
//        opacity: enabled ? 1.0 : 0.3
//        color: control.down ? "#17a81a" : "#21be2b"
//        horizontalAlignment: Text.AlignHCenter
//        verticalAlignment: Text.AlignVCenter
//        elide: Text.ElideRight
//    }

    background: Rectangle {
        implicitWidth: 40
        implicitHeight: 40
//        color: Qt.darker("#33333333", control.enabled && (control.checked || control.highlighted) ? 1.5 : 1.0)
        color: Qt.lighter("mediumorchid", control.hovered ? 1.2 : 1.1)

        opacity: enabled ? 1 : 0.3
//        visible: control.down || (control.enabled && (control.checked || control.highlighted))
        Behavior on color{ColorAnimation{duration: 75}}
    }
}
