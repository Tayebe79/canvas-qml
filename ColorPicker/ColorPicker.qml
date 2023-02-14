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
            }
        }
        ColorItem {
            cellColor: "green";
            onClicked: {
                control.colorChanged(cellColor);
            }
        }
        ColorItem {
            cellColor: "pink";
            onClicked: {
                control.colorChanged(cellColor);
            }
        }
        ColorItem {
            cellColor: "yellow";
            onClicked: {
                control.colorChanged(cellColor);
            }
        }
        ColorItem {
            cellColor: "steelblue";
            onClicked: {
                control.colorChanged(cellColor);
            }
        }
        ColorItem {
            cellColor: "black";
            onClicked: {
                control.colorChanged(cellColor);
            }
        }
    }
}
