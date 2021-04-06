import QtQuick 2.0
import com.K2D 1.0
import "./" as L

L.K2D_Base {
    id:baseScreen

    function showUiKitCenterInParent(codeObj,parent,playAnimaction){
        var tempCom;

        switch(codeObj.显示类型){
        case "IMAGE":
            tempCom = createImage(codeObj,parent,playAnimaction);
            break;

        case "SPINE":
            tempCom = createSpine(codeObj,parent,playAnimaction);
            break;

        case "Z_IMAGE":
            tempCom = createZ_Image(codeObj,parent,playAnimaction);
            break;

        case "VIDEO":
            tempCom = createVideo(codeObj,parent);
            break;
        }

        return tempCom;
    }


    function createImage(codeObj,parent,playAnim){
        var tempCom = K2D.qml("framework_kit_image.qml",parent);
        tempCom.source = K2D.image(codeObj.资源);

        if(tempCom && codeObj.展出效果 && playAnim){
            var anim = K2D.qml("Animations.qml",tempCom);
            anim.init(tempCom,codeObj.展出效果.split(","));
        }

        return tempCom;
    }


    function createSpine(codeObj,parent,playAnim){
        var tempCom = K2D.qml("framework_kit_spine.qml",parent);

        tempCom.centerInParent(codeObj.资源.X偏移 ? codeObj.资源.X偏移 : 0,codeObj.资源.Y偏移? codeObj.资源.Y偏移: 0);
        tempCom.scale = codeObj.资源.缩放?codeObj.资源.缩放:1;
        tempCom.init(codeObj.资源.素材,codeObj.资源.动画,codeObj.资源.循环);

        //----------------------
        if(tempCom && codeObj.展出效果 && playAnim){
            var anim = K2D.qml("Animations.qml",tempCom);
            anim.init(tempCom,codeObj.展出效果.split(","));
        }

        return tempCom;
    }

    function createZ_Image(codeObj,parent,playAnim){
        var tempCom = K2D.qml("framework_kit_zimage.qml",parent);

        tempCom.duration = codeObj.持续时间 ? codeObj.持续时间 * 1000 : 500;
        tempCom.source = K2D.image(codeObj.资源);

        if(tempCom && codeObj.展出效果 && playAnim){
            var anim = K2D.qml("Animations.qml",tempCom);
            anim.init(tempCom,codeObj.展出效果.split(","));
        }

        return tempCom;
    }


    function createVideo(codeObj,parent){
        var tempCom = K2D.qml("framework_kit_video.qml",parent);
        tempCom.source = codeObj.资源;
        return tempCom;
    }

}
