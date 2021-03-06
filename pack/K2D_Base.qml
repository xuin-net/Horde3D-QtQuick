import QtQuick 2.0
import com.K2D 1.0
Item {
    id:baseScreen

    property bool debug: true

    signal exitScreen(var codeObj);
    signal destructed();

    function onExit(){
    }


    function init(codeObj){

    }

    function parsingCode(codeObj){

    }

    function log(st){
        if(debug == true)
            console.log(st);
    }

    Component.onDestruction: {
        log("base onDestruction");
        destructed();
    }

    Component.onCompleted: {
        log("base onCompleted");
    }

}
