import QtQuick
import QtQml

/* ***********************************************
 *  Node is ...
 * ***********************************************/
QtObject {
    id: thisNode
    property string name:       "<Unknown>"

    //! Is the text represents content of the item
    property string contentText:""

    //!
    property int    x:          150

    //!
    property int    y:          100

    //!
    property int    width:      200

    //!
    property int    height:     150

    //!
    property string color:      "steelblue"

    //!
    property bool   isSelected: true

    //!
    property int    id:         0

    //!
    property bool   justRead:   false

    //!
    property bool focusTracker: true
}
