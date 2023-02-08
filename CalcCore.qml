import QtQuick

QtObject {

    property int value: 100


    onValueChanged: {
        console.log("Value is Changed: " + value)
    }

    property Timer timer : Timer {
        id: timer
        interval: 100
        running: true
        repeat: true


        onTriggered: {
            value = Math.random() * 100;
        }


    }
}
