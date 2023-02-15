import QtQuick
import QtQml
import qtquick1

/*! ***********************************************************************************************
 * Node Manager. Cards are added, deleted or duplicated here.
 * ************************************************************************************************/

QtObject {
    id: manager

    /* Declaring properties
         * ****************************************************************************************/

    property var nodes: []
    property int count:10 ;
    property string nodeCreator:
            'import QtQuick;
            import qtquick1;
            Node{}'

    //adding a new node (dynamically). input arguements are mouseX and mouseY,
    // for placing the new card in the correct place
    function addNode(x,y) {
        var node3= Qt.createQmlObject(
           nodeCreator, manager)
        count = count + 1
        node3.id = count
        node3.x = x;
        node3.y = y;
        node3.contentText = node3.contentText
        nodes.push(node3);
        nodesChanged();
        selectItem(node3.id)
    }

    //deleting a node. input arguement is the node id.
    function deleteNode(x) {
        for(var i=0; i<nodes.length; i++){
            if(nodes[i].id === x){
                selectItem(-1)
                nodes.splice(i,1);
                nodesChanged();
            }
        }
    }

    //this function keeps track of selected nodes
    //input arguement is the node id (the current node)
    //all other nodes' isSelected property is set to false
    function selectItem(x) {
        for(var i=0; i<nodes.length; i++){
            if(nodes[i].id !== x){
                nodes[i].isSelected = false;
            }
        }
    }

    //this function is to duplicate chosen card
    //input arguements are cards' properties. the new card is placed 50 pixels
    //away from the lower right corner of the copied card
    function duplicate (contentText, x, y, zcolor, isSelected, id, justRead){
        var node4= Qt.createQmlObject(
           nodeCreator, manager)
        count = count + 1
        node4.id = count
        node4.x = x+50;
        node4.y = y+50;
        node4.contentText = contentText
        node4.color = zcolor
        node4.isSelected = isSelected
        node4.justRead = justRead
        nodes.push(node4);
        nodesChanged();
        selectItem(node4.id)
    }

    //this function is for updating the nodes
    function nodeChanger(){
        nodesChanged();
    }
}

//    property Node _node1: Node {
//    }

//    Component.onCompleted: {
//        nodes = nodes.concat(_node1, _node2);
////        nodes.push(_node1);
////        nodesChanged();
//    }
