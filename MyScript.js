

var component;
var sprite;

function createSpriteObjects(parentObj, mouseX, mouseY) {
    component = Qt.createComponent("rectangle1.qml");
    if (component.status === Component.Ready)
        finishCreation(mouseX, mouseY);
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation(mouseX, mouseY) {
    if (component.status === Component.Ready) {
        sprite = component.createObject(mainRec, {x: mouseX, y: mouseY});
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        } else {
//            sprite.opacity = 1;
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}
