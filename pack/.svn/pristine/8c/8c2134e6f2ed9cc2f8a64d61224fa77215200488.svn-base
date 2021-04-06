import QtQuick 2.5
import QtQuick.Controls 2.1
import com.K2D 1.0
import Horde3D 1.0
import "./" as L


L.K2D_BaseGame {
    id:self

    property var mCodeObj;
    property bool isGameOver:false
    property bool isGameOvering:false

    property int tempIndex: -1;

    function onExit(){
//        horde3d.cleanup();
//        horde3d.fileName = "";
//        horde3d.sourcePath = "";
//        isGameOvering = true;
//        log("game onExit")
//        baseGameOnExit();
    }

    function init(codeObj){
        mCodeObj = codeObj;

        parsingCode(codeObj);
    }


    function soundPlayEnd(type){
        if(type == "sound"){

        }
    }

    function parsingCode(codeObj){
        if(mCodeObj.页码 != codeObj.页码 || isGameOver == true){
            exitScreen(codeObj);
            return;
        }

        if(isGameOvering == true){
            return;
        }
    }

    Horde3D {
        id: horde3d
        width: parent.width;
        height: parent.height;
//        sourcePath: K2D.openFolder;
//        viewScale: 45;
        shadow: true;
        sourcePath: {
           var tempFolder = K2D.openFolder
            tempFolder = tempFolder.replace("qrc:",":");
            return tempFolder;
        }
        models: [
            Horde3dmodel{
                id: model_1;
                name: "boss";
                aniName: "boss";
                scale: 1.0;
            }
//            Horde3dmodel{
//                id: model_2;
//                name: "astroBoy_walk_Maya";
//                aniName: "astroBoy_walk_Maya";
//                scale: 0.2;
//                x: 3;
//            },
//            Horde3dmodel{
//                id: model_3;
//                name: "animated_letters";
//                aniName: "animated_letters";
//                scale: 0.5;
//                z: -10;
//            },
//            Horde3dmodel{
//                id: model_4;
//                name: "animation_robot";
//                aniName: "animation_robot";
//                scale: 0.5;
//                x: -2;
//            },
//            Horde3dmodel{
//                id: model_5;
//                name: "knight";
//                anis: ["knight_attack","knight_order"];
//                aniName: "knight_attack";
//                scale: 0.05;
//                z: -1;
//                rotationY: 180;
//            }
        ]
    }

//    ParallelAnimation{
//        id: showAni;
//        PropertyAnimation{target: model_4;property:"x";from: 0;to: 5;duration:3000;}
//        PropertyAnimation{target: model_4;property:"y";from: 0;to: 1;duration:3000;}
//        PropertyAnimation{target: model_4;property:"z";from: 0;to: 4;duration:3000;}
//    }

    Component.onCompleted: {
        showAni.start();
    }

    SequentialAnimation{
        id: showAni;
        loops: Animation.Infinite;
        NumberAnimation{target: model_1;property: "rotationY";from: 0;to: 360;duration: 4000;}
    }



}
