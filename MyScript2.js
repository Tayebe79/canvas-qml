
var component;
var sprite;

function createSpriteObjects() {
    component = Qt.createComponent("buttons.qml");
    if (component.status === Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation(mouseX, mouseY) {
    if (component.status === Component.Ready) {
        sprite = component.createObject(mainRec, {x: 100, y: 100});
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
