import QtQuick 2.5
import com.K2D 1.0
import "./" as L

L.K2D_BaseKit {
    id:normalScene;

    property var mCodeObj;

    property var _currentView: null;

    property var magic: null;

    property var magicBz: null;

    function init(codeObj){
        parsingCode(codeObj);
    }

    function onExit() {
        if(_currentView && typeof(_currentView.onExit) == "function"){
            _currentView.onExit();
        }
    }

    function parsingCode(codeObj){
        if(codeObj.显示类型 == "VIDEO"){
            magicVisibe(false);
            K2D.stopAllSound();
        }else{
            magicVisibe(true);
            K2D.playSound(codeObj.声音);
        }

        removeCurrentView();

        _currentView = showUiKitCenterInParent(codeObj,normalScene,true);

        if(codeObj.背景){
            tsbg.source = K2D.image(codeObj.背景);
        }else{
            tsbg.source = "";
        }

        mCodeObj = codeObj;

        magicAnimaction();
        
    }

    function removeCurrentView(){
        if(_currentView){
            if(typeof(_currentView.onExit) == "function"){
                _currentView.onExit();
            }
            _currentView.destroy(1);
        }
    }


    function magicAnimaction(){
        if(magic){
            magic.setAnimation(0,"msf_2",false);
            magic.addAnimation(0,"msf_1",true,0);
        }

        if(magicBz){
            magicBz.setAnimation(0,"xing",false);
        }

    }

    function magicVisibe(v){
        if(magic){
            magic.visible = v;
        }

        if(magicBz){
            magicBz.visible = v;
        }
    }


    Image {
        id: bgImg
        asynchronous: true;
        source: K2D.image("book_bg.png");
        z:-1;
    }

    Image{
        id:tsbg
        asynchronous: true;
        source: "";
        z:0;
    }


    Component.onCompleted: {

        magic = K2D.qml("framework_kit_spine.qml",normalScene);
        magic.x = 890;
        magic.y = 560;
        magic.z = 1;
        magic.scale = 0.7;
        magic.init("mfs","msf_1",true);


        magicBz = K2D.qml("framework_kit_spine.qml",normalScene);
        magicBz.centerInParent();
        magicBz.init("xing","xing",false);
        magicBz.z = 20;

        //K2D.playBgSound("bg.mp3");
    }
}
