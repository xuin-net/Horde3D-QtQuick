import QtQuick 2.5
import com.K2D 1.0

Item {
    id:self;

    //PT , GAME_code
    property string currentSceneType: "";

    property var currentSceneView: null;
    property var mCodeObj: null;

    function readCode(codeObj){
        mCodeObj = codeObj;
        if(currentSceneType == ""){
            createNewScreen(codeObj);
        }else if(codeObj.游戏 === true){
            if(codeObj.游戏模式 && codeObj.游戏模式.ID && currentSceneType == "GAME_" + codeObj.游戏模式.ID || currentSceneType == "GAME_" + codeObj.code){
                if(currentSceneView){
                    currentSceneView.parsingCode(codeObj);
                }
            }else{
                createNewScreen(codeObj);
            }
        }else {
            if(currentSceneView){
                currentSceneView.parsingCode(codeObj);
            }
        }


    }

    function createNewScreen(codeObj){
        if(currentSceneView){
			console.log("#####$$$$$$$$$",typeof(currentSceneView.onExit) , "function");
            if(typeof(currentSceneView.onExit) == "function"){
				console.log("#####$$$$$$$$$");
                currentSceneView.onExit();
                currentSceneView.destructed.connect(createComponet);
            }
            K2D.stopAllSound();
            currentSceneView.destroy(1);
            currentSceneView = null;
        }else{
            createComponet();
        }
    }

    function createComponet(){
        var qmlFile = "";
        if(mCodeObj.游戏 == true){
            qmlFile = mCodeObj.游戏模式.QML;
        }else{
            qmlFile = "framework_normal.qml";
        }

        currentSceneView = K2D.qml(qmlFile,self);
        if(currentSceneView){
            currentSceneView.width = self.width;
            currentSceneView.height = self.height;

            currentSceneView.exitScreen.connect(exitScene);
            currentSceneView.init(mCodeObj);

            //--
            if(mCodeObj.游戏 == true){
                if(mCodeObj.游戏模式.ID){
                    currentSceneType = "GAME_" + mCodeObj.游戏模式.ID;
                }else{
                    currentSceneType = "GAME_" + mCodeObj.code;
                }
            }else{
                currentSceneType = "PT";
            }
        }
    }

    function exitScene(codeObj){
        K2D.stopAllSound();
		K2D.stopMediaVideoPlayer();
        createNewScreen(codeObj);
    }


}
