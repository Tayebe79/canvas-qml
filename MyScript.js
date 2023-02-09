

var component;
var sprite;
let objs = new Array();

//function hi(){
//    for (var i = 0; i < objs.length; i++) {
//        objs[i].isSelected = false;
//        console.log("imcalled");
//    }
//}

function createSpriteObjects(parentObj, mouseX, mouseY) {
    component = Qt.createComponent("Rectangle1.qml");
    if (component.status === Component.Ready)
        finishCreation(mouseX, mouseY);
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation(mouseX, mouseY) {


    if (component.status === Component.Ready) {
//        hi();
        sprite = component.createObject(mainRec, {x: mouseX, y: mouseY});
        objs.push(sprite);



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
    return objs;
}
