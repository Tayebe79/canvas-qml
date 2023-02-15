import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Universal
import qtquick1
import QtQuick.Dialogs


/*! ***********************************************************************************************
 * Sceneview is defined as one flickable object (inside a rectangle).
 * ************************************************************************************************/


Rectangle {
    id: container
    /* Property Declarations
         * ****************************************************************************************/

    /* Property Declarations
         * ****************************************************************************************/
     property NodeManager nodeManager

    /* Property Style
         * ****************************************************************************************/
    color: "transparent"


    Flickable{
        id:flickable
        anchors.fill: parent
        contentWidth: parent.width * 2
        contentHeight: parent.height * 2
        interactive: false

        // Dot Grid Background
        Grid{
            rows: 200
            columns: 200
            spacing: 20
            Repeater {
                model: 40000
                Rectangle {
                    width: 1; height: 1
                    color: "white"
                    opacity: 0.2
                }
            }
        }

        //Repeater for building the model
        Repeater {
            model: nodeManager.nodes
            delegate: NodeView {
                node: modelData
            }
        }

        //Right click for adding new cards
        MouseArea {
            acceptedButtons: Qt.RightButton
            anchors.fill: parent
            onClicked: {
                nodeManager.addNode(mouseX,mouseY)
            }
        }

        //ScrollBars for screen
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
