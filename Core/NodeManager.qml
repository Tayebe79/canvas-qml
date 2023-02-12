import QtQuick

QtObject {
    property var nodes: []


    property Node _node1: Node {
        x: 100
        y: 20
        color: "red"
        contentText: "hello world!!!!"
    }
    property Node _node2: Node {
        x: 0
        y: 200
        color: "blue"
    }
    property Node _node3: Node {
        x: 150
        y: 25
        color: "lightred"
    }
    property Node _node4: Node {
        x: 0
        y: 200
        color: "bluesky"
    }

    Component.onCompleted: {
        nodes = nodes.concat(_node1, _node2, _node3, _node4);
//        nodes.push(_node1);


//        nodesChanged();
    }


    function addNode(node: Node) {

    }

    function deleteNode(node: Node) {

    }

    function selectItem(node: Node) {
        // deselect all other items

        // select target node
    }
}
