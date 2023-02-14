import QtQuick
import qtquick1

Rectangle {
    id: container
    property NodeManager nodeManager
    property int lala : 0
    color: "transparent"
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
}
//onTextChanged1: (textCont)=> {
//    node.contentText = textCont
//}
