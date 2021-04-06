import QtQuick 2.0
import com.K2D 1.0
Item {
    id:winLayer
    
    anchors.fill: parent;

    Rectangle{
        width: 1136;
        height: 640;
        color: "black";
        opacity: 0.5;
    }

    function init(scene,isWin){
        K2D.stopSound();
        if(isWin == true){
            var spine = K2D.qml("framework_kit_spine.qml",winLayer);
            spine.centerInParent();
            spine.init("jz","jz_1",false);
            spine.addAnimation(0,"jz_2",true,0);
            spine.complete.connect(function(trackIndex, loopCount){
                if(scene){
                    scene.isGameOvering = false;
                    scene.isGameOver = true;
                }
            })
            K2D.qSound("gamewin.wav");
        }else{
            K2D.qSound("gamelost.wav");
            var spine = K2D.qml("framework_kit_spine.qml",winLayer);
            spine.centerInParent();
            spine.init("Game_fail","Game_fail_1",false);
            spine.addAnimation(0,"Game_fail_2",true,0);
            spine.complete.connect(function(trackIndex, loopCount){
                if(scene){
                    scene.isGameOvering = false;
                    scene.isGameOver = true;
                }
            })
        }
    }

}
