import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Universal
import qtquick1
import QtQuick.Dialogs
Rectangle {
    id: container
    color: "transparent"

    property NodeManager nodeManager

    Flickable{
        id:flickable
        anchors.fill: parent
        contentWidth: parent.width * 2
        contentHeight: parent.height * 2

        Grid{
            rows: 100
            columns: 100
            spacing: 20
            Repeater {
                model: 10000
                Rectangle {
                    width: 1; height: 1
                    color: "white"
                    opacity: 0.2
                }
            }
        }

        Repeater {
            model: nodeManager.nodes
            delegate: NodeView {
                node: modelData
            }
        }

        MouseArea {
            acceptedButtons: Qt.RightButton
            anchors.fill: parent
            onClicked: {
                nodeManager.addNode(mouseX,mouseY)
            }
        }


        ScrollBar.horizontal: ScrollBar {
            id: hbar;
            active: vbar.active
            anchors.margins: 5
            height: 5
        }
        ScrollBar.vertical: ScrollBar {
            id: vbar;
            active: hbar.active
            anchors.margins: 5
            width: 5
        }


    }


}
