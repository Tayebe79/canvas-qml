import QtQuick
import QtQuick.Layouts
import qtquick1

Rectangle {
    id: control
    width: colorPicker.width + 4
    height: 50
    color: "transparent"

    signal colorChanged(var colorName)

    RowLayout {
        id: colorPicker
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 2
//        rows: 1; columns: 6; spacing: 2
        ColorItem {
            cellColor: "red";
            onClicked: {
                control.colorChanged(cellColor);
//            textRec.border.color = cellColor
    //                          colorButton1.controller.color = cellColor
            }
        }
        ColorItem {
            cellColor: "green";
            onClicked: textRec.border.color = cellColor
        }
        ColorItem {
            cellColor: "blue";
            onClicked: textRec.border.color = cellColor
        }
        ColorItem {
            cellColor: "yellow";
            onClicked: textRec.border.color = cellColor
        }
        ColorItem {
            cellColor: "steelblue";
            onClicked: textRec.border.color = cellColor
        }
        ColorItem {
            cellColor: "black";
            onClicked: {
                textRec.border.color = cellColor
            }
        }
    }
}
