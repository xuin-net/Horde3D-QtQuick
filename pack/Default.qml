import QtQuick 2.5
import com.K2D 1.0
import "./" as L


L.K2D_BaseGame {
    id:self

    property var mCodeObj;
    property bool isGameOver:false
    property bool isGameOvering:false



    function onExit(){
        isGameOvering = true;
        log("game onExit")
        baseGameOnExit();
    }

    function init(codeObj){
        mCodeObj = codeObj;

    }


    function soundPlayEnd(type){
        if(type == "sound"){

        }
    }

    function parsingCode(codeObj){
        if(codeObj.页码 != mCodeObj.页码 || isGameOver == true){
            exitScreen(codeObj);
            return;
        }

        if(mCodeObj.code == codeObj.code){
            exitScreen(codeObj);
            return;
        }

        if(isGameOvering == true){
            return;
        }

    }

//    Rectangle{
//        color: "white"
//        width: 1136
//        height: 640
//    }

//    Text{
//        text: "<font color='#322423'>I</font> <font color='#0c5aa5'> 'm </font>"
//        anchors.centerIn: parent
//        font.pointSize: 100
//    }

}
