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
        sourcePath: {
           var tempFolder = K2D.openFolder
            tempFolder = tempFolder.replace("qrc:",":");
            return tempFolder;
        }
        models: [
//            Horde3dmodel{
//                id: model_1;
//                name: "boss";
//                aniName: "boss";
//                scale: 1.0;
//            }
//            Horde3dmodel{
//                id: model_2;
//                name: "astroBoy_walk_Maya";
//                aniName: "astroBoy_walk_Maya";
//                scale: 0.2;
//                x: -3;
//            },
            Horde3dmodel{
                id: model_3;
                name: "animated_letters";
                aniName: "animated_letters";
                scale: 0.5;
            }
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
//            }
        ]
    }

//    ParallelAnimation{
//        id: showAni;
//        PropertyAnimation{target: model_4;property:"x";from: 0;to: 5;duration:3000;}
//        PropertyAnimation{target: model_4;property:"y";from: 0;to: 1;duration:3000;}
//        PropertyAnimation{target: model_4;property:"z";from: 0;to: 4;duration:3000;}
//    }

    Column{
        spacing: 8;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;

        Row{
            spacing: 8;
            Label{
                width: 80;
                color: "snow"
                font.pointSize: 20;
                text: "rotationX"
            }
            Slider {
                value: 0.5;
                onPressedChanged: {
                    model_3.rotationX = (value-0.5)*180;
                }
            }
        }
        Row{
            Label{
                width: 80;
                color: "snow"
                font.pointSize: 20;
                text: "rotationY"
            }
            Slider {
                value: 0.5;
                onPressedChanged: {
                    model_3.rotationY = (value-0.5)*720;
                }
            }
        }
        Row{
            Label{
                width: 80;
                color: "snow"
                font.pointSize: 20;
                text: "rotationZ"
            }
            Slider {
                value: 0.5;
                onPressedChanged: {
                    model_3.rotationZ = (value-0.5)*180;
                }
            }
        }
        Row{
            Label{
                width: 80;
                color: "snow"
                font.pointSize: 20;
                text: "x"
            }
            Slider {
                value: 0.5;
                onPressedChanged: {
                    model_3.x = (value-0.5)*8;
                }
            }
        }
        Row{
            Label{
                width: 80;
                color: "snow"
                font.pointSize: 20;
                text: "y"
            }
            Slider {
                value: 0.5;
                onPressedChanged: {
                    model_3.y = (value-0.5)*4;
                }
            }
        }
        Row{
            Label{
                width: 80;
                color: "snow"
                font.pointSize: 20;
                text: "z"
            }
            Slider {
                value: 0.5;
                onPressedChanged: {
                    model_3.z = (value-0.5)*8;
                }
            }
        }
        Row{
            Label{
                width: 80;
                color: "snow"
                font.pointSize: 20;
                text: "scale"
            }
            Slider {
                value: 0.5;
                onPressedChanged: {
                    model_3.scale = 1.0+(value-0.5);
                }
            }
        }
    }
//    Timer{
//        interval: 16000;repeat: true;running: false;
//        onTriggered: {
//            tempIndex++;
//            if(tempIndex==0)
//                model_5.aniName = "knight_order";
//            else if(tempIndex==1){
//                model_5.aniName = "knight_attack";
//                tempIndex = -1;
//            }
//        }
//    }


}
