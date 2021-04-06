import QtQuick 2.5
//import QtQuick.Controls 1.4
import com.K2D 1.0
import "./config.js" as Config;
import "./cgame.js" as Gconfig;

KBookMain {
    id:bookRoot

    property var bookCover: null

    property var bookContent: null;

    property var followObj: null;

    Component.onCompleted: {
        
        K2D.bookRoot = bookRoot;

        showCover(true);

        console.log("bookRoot w,h-->",width,height,K2D.bookRoot);
    }

    onReadCode: {
        if(code == 6){
            //轻触电源-停止键
            K2D.followStop();
            K2D.stopAllSound();
            K2D.stopMediaVideoPlayer();
            gotoBackHomeCover(true);
        }
		else if(code == -1)
		{
			K2D.followStop();
            K2D.stopAllSound();
            K2D.stopMediaVideoPlayer();
            gotoBackHomeCover(false);
		}
        else if(code == 99 ){

            if(bookContent != null && bookContent.currentSceneType != "PT"){
                KToast.label("请先退出游戏模式","bottom",true);
                return;
            }

            K2D.followStart();
        }
        else{
            runCode(code);
        }
    }


    function runCode(code){

        var codeObj = getCodeObj(code);

        if(!codeObj){
            KToast.label("选择超出本书内容","bottom",true);
        }else{
            if(codeObj.游戏模式){
                K2D.followStop();
            }else if(K2D.followGetState() > 1){
                K2D.followStop();
            }

            removeCoverAndShowContent();
            bookContent.readCode(codeObj);
        }
    }


    function showCover(isBgSound){
        K2D.menuVisible = true;
		bookCover = K2D.qml("framework_cover.qml",bookRoot);
        bookCover.width = bookRoot.width;
        bookCover.height = bookRoot.height;
		if(!isBgSound){
			bookCover.isPlayerbgSound = false;
		}
    }


    function removeCoverAndShowContent(){
        if(bookCover){
            bookCover.destroy(1);
        }
        K2D.menuVisible = false;
        if(bookContent == null){
            bookContent = K2D.qml("framework_content.qml",bookRoot);
            bookContent.width = bookRoot.width;
            bookContent.height = bookRoot.height;
        }
    }

    function getCodeObj(code){
        var codeObj =  Config.内文码[code];

        if(codeObj){
            codeObj.code = code;
            //console.log(JSON.stringify(Gconfig.内文码[codeObj.code]))
            if(codeObj.游戏 == true && Gconfig.内文码[codeObj.code]){
                codeObj.游戏模式 = Gconfig.内文码[codeObj.code];
            }
        }

        return codeObj;
    }


    function gotoBackHomeCover(isCoverBg){

        if(bookContent){
            bookContent.destroy(1);
        }

        if(bookCover){
            bookCover.destroy(1);
        }

        showCover(isCoverBg);
        
    }


}
