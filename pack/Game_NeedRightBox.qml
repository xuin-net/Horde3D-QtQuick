import QtQuick 2.5
import com.K2D 1.0
import "./" as L

Item{
    id:item_needRightBox
    y:50

    property int rCount: 0;

    property var boxArr: new Array
    //兼容边界值
    property int borderLeft :APP.sceneBorderLeft < (APP.screenDesignWidth - 1136) /2 ? 0 : APP.sceneBorderLeft - (APP.screenDesignWidth - 1136) /2;

    function init(i){
        for(var u = 0; u < i; u ++){
            var needRightbox = cmp_needRightBox.createObject(item_needRightBox)
            needRightbox.x = u*(needRightbox.width+10)
            boxArr.push(needRightbox);
        }
        item_needRightBox.x = 1136-borderLeft-i*(needRightbox.width+10)-50
    }

    function setRight(i){
        if(i && i < boxArr.length-1){
            boxArr[i].onRight();
        }else if(rCount < boxArr.length){
            boxArr[rCount].onRight();
            rCount ++;
        }
    }

    function reset(){
        for(var i in boxArr){
            boxArr[i].source = K2D.image("NeedRightBox0.png");
        }
    }

    Component{
        id:cmp_needRightBox
        Image{
            id:img_needRightBox
            source: K2D.image("NeedRightBox0.png")
            x:-width/2
            y:-height/2

            function onRight (){
                am_right.start();
            }

            SequentialAnimation{
                id:am_right
                running: false;
                ScaleAnimator{target: img_needRightBox;from:1;to:1.1;duration: 100}
                ScriptAction{script: {img_needRightBox.source = K2D.image("NeedRightBox1.png")}}
                ScaleAnimator{target: img_needRightBox;from:1.1;to:1;duration: 100}
            }
        }
    }
}

