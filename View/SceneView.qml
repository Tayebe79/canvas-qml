import QtQuick
import qtquick1

Rectangle {
    property NodeManager nodeManager

    color: "transparent"


    Repeater {
        model: nodeManager.nodes
        delegate: NodeView {
            node: modelData
        }
    }
}
