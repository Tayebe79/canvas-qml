import QtQuick
import QtQml
import qtquick1



QtObject {
    id: manager

    property var nodes: []
    property int count:10 ;

//    property Node _node1: Node {
//        x: 100
//        y: 20
//        color: "red"
//        contentText: "hello world!!!!"
//    }
//    property Node _node2: Node {
//        x: 0
//        y: 200
//        color: "blue"
//    }


//    Component.onCompleted: {
//        nodes = nodes.concat(_node1, _node2);
////        nodes.push(_node1);
////        nodesChanged();
//    }


    function addNode(x,y) {
        var node3= Qt.createQmlObject(
           'import QtQuick;
            import qtquick1;
            Node{
                color: "steelblue"
                isSelected:true
            }', manager)
        count = count + 1
        node3.id = count
        node3.x = x;
        node3.y = y;
        node3.contentText = node3.contentText
        nodes.push(node3);
        nodesChanged();
        selectItem(node3.id)
    }

    function deleteNode(x) {
        for(var i=0; i<nodes.length; i++){
            if(nodes[i].id === x){
                selectItem(-1)
                nodes.splice(i,1);
                nodesChanged();
            }
        }
    }

    function selectItem(x) {
        for(var i=0; i<nodes.length; i++){
            if(nodes[i].id !== x){
                nodes[i].isSelected = false;
            }
        }
    }

}
