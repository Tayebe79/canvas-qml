import QtQuick
import QtQuick.Controls

Rectangle {
    id: textRec
    radius:10
    width: 160
    height: 100
    color: "black"
    border.width : textRec.width / 20
    border.color: "purple"
    Component.onCompleted: console.log("lodead111111111")
    ScrollView{
        id: view
        width: 200
        height: 200
        anchors.fill: parent
        anchors.margins: parent.border.width
        background: Rectangle { color: "black" }
        TextArea {
            id: textInput1
            verticalAlignment : textRec.verticalCenter
            horizontalAlignment: textRec.horizontalCenter
            placeholderText: qsTr("Enter description")
            wrapMode: TextArea.WrapAnywhere
//            anchors.fill: parent
        }
    }


    MouseArea {
            id: selectionMouseArea
            property int initialXPos
            property int initialYPos
            property bool justStarted

            anchors.fill: parent
            z: 2 // make sure we're above other elements
            onPressed: {
                if (mouse.button === Qt.LeftButton && mouse.modifiers & Qt.ShiftModifier)
                {
                    console.log("Mouse area shift-clicked !")
                    // initialize local variables to determine the selection orientation
                    initialXPos = mouse.x
                    initialYPos = mouse.y
                    justStarted = true

                    flickableView.interactive = false // in case the event started over a Flickable element
                    textRec.x = mouse.x
                    textRec.y = mouse.y
                    textRec.width = 0
                    textRec.height = 0
                    textRec.visible = true
                }
            }
            onPositionChanged: {
                if (textRec.visible === true)
                {
                    if (justStarted === true && (mouse.x !== initialXPos || mouse.y !== initialYPos))
                    {
                        if (mouse.x >= initialXPos)
                        {
                            if (mouse.y >= initialYPos)
                               textRec.rotation = 0
                            else
                               textRec.rotation = -90
                        }
                        else
                        {
                            if (mouse.y >= initialYPos)
                                textRec.rotation = 90
                            else
                                textRec.rotation = -180
                        }

                        justStarted = false
                        //console.log("Selection rotation: " + textRec.rotation)
                    }

                    if (textRec.rotation === 0 || textRec.rotation === -180)
                    {
                        textRec.width = Math.abs(mouse.x - textRec.x)
                        textRec.height = Math.abs(mouse.y - textRec.y)
                    }
                    else
                    {
                        textRec.width = Math.abs(mouse.y - textRec.y)
                        textRec.height = Math.abs(mouse.x - textRec.x)
                    }
                }
            }

            onReleased: {
//                textRec.visible = false
                // restore the Flickable duties
                flickableView.interactive = true
            }

    }
}
