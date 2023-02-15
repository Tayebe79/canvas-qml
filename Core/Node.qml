import QtQuick
import QtQml

/* ***********************************************
 *  A Node is a QtObject representing one card.
 * ***********************************************/
QtObject {

    property string name:       "<Unknown>"

    //! the text written in the card
    property string contentText:""

    //! x position
    property int    x:          150

    //! y position
    property int    y:          100

    //! width of the card
    property int    width:      200

    //! height of the card
    property int    height:     150

    //! color of the color
    property string color:      "steelblue"

    //! is the card currently selected
    property bool   isSelected: true

    //! card id (unique for each card)
    property int    id:         0

    //! is the text content locked (read only)
    property bool   justRead:   false

}
