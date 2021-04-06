import QtQuick 2.0
import com.K2D 1.0
import "./" as L

L.K2D_Base {
    id:baseScreen

    property var needRightBoxs: null

    function addRightBox(game,i){
        needRightBoxs = K2D.qml("Game_NeedRightBox.qml",game)
        needRightBoxs.z = 100
        needRightBoxs.init(i);
    }

    function setRightBox(i){
        needRightBoxs.setRight(i);
    }

    function soundPlayAndCallBack(file,t,call,type){
        log("soundPlayAndCallBack--",file,t,call,type);
        K2D.playSound(file);
        KTimerOut.removeTimeForKey("playSound");
        KTimerOut.setTimeout("playSound",t,function(key){
            if(baseScreen){
                call(type)
            }
        })
    }

    function createSpine(file,am,p){
        var spineAm = K2D.qml("framework_kit_spine.qml",p);
        spineAm.init(file,am,true);
        return spineAm;
    }

    function showGameOver(scene,isWin){
        var win = K2D.qml("GameOver.qml",baseScreen);
        win.z = 10;
        win.init(scene,isWin);
    }

    function baseGameOnExit(){
        K2D.stopAllSound();
        KTimerOut.removeTimeForKey("playSound");
        log("base game onExit");
    }

    function playGameEffect(type){
        if(type == "right"){
            K2D.playSound("game_r"+Math.floor(Math.random()*4+1)+".mp3");
        }else if (type == "wrong"){
            K2D.playSound("game_w"+Math.floor(Math.random()*4+1)+".mp3");
        }else if(type == "win"){
            K2D.playSound("game_win"+Math.floor(Math.random()*2+1)+".mp3");
        }
    }

}
