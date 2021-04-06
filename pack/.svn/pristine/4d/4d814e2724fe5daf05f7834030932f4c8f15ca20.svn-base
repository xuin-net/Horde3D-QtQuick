import QtQuick 2.5

//http://blog.csdn.net/henreash/article/details/8002147

Item {
    id:anim;
    signal complete();

    property Item mTarget: null;

    property var actionArray: null;

    property var currentIndex: 0;

    property int target_width:0;
    property int target_height:0;

    function init(_target,_actionArray){
        console.log(_actionArray);
        mTarget = _target;
        target_width = mTarget.width;
        target_height = mTarget.height;
        actionArray = _actionArray;

        console.log("控制:" + mTarget , "动作:" + actionArray);


        nextAction();
    }

    function nextAction(){

        if(currentIndex >= actionArray.length){
            complete();
            return;
        }
        //==

        console.log("执行动画",actionArray[currentIndex]);

        if(actionArray[currentIndex] == "旋转移入"){
            rotationIn.start();
        }else if(actionArray[currentIndex] == "向上弹出"){

            var r = Math.floor(Math.random()*3);
            if(r==2){
                mTarget.x = (1136-target_width)/2
                upIn.start();
            }else{
                var op = ""
                var fm = 0;
                r = Math.floor(Math.random()*4);
                if(r==0){mTarget.x = -300;mTarget.y = (640-target_height)/2}
                if(r==1){mTarget.x = (1136-target_width)/2;mTarget.y = -300}
                if(r==2){mTarget.x = 1136+300;mTarget.y = (640-target_height)/2}
                if(r==3){mTarget.x =  (1136-target_width)/2;mTarget.y = 640+300}
                randomIn.start();
            }

        }else if(actionArray[currentIndex] == "缩放弹出"){
            mTarget.x = (1136-target_width)/2
            mTarget.y = (640-target_height)/2
            scaleIn.start();
        }else if(actionArray[currentIndex] == "浮动"){
            upRoop.start();
        }

        currentIndex++;
    }

    SequentialAnimation {
        id:rotationIn
        ParallelAnimation{
            NumberAnimation {target: anim.mTarget;properties: "opacity";from: 0.0;to: 1.0;duration: 500}
            SequentialAnimation {
                ScaleAnimator{target: anim.mTarget;from: 0.0;to: 1.5;duration: 400}
                ScaleAnimator{target: anim.mTarget;from: 1.5;to: 1;duration: 200}
            }
            RotationAnimation { target: anim.mTarget;  to: 360; duration: 1500;
                easing.type: Easing.OutElastic;easing.amplitude: 1.0;easing.period: 1.2}
            PathAnimation {
                id: pathAnim
                target:mTarget;
                duration:500;
                path: Path {
                    startX: 0; startY: 640

                    PathCubic {
                        x: (1136-target_width)/2
                        y: (640-target_height)/2

                        control1X: -50; control1Y: 250
                        control2X: x-50; control2Y: y-50
                    }
                }
            }
        }
        onRunningChanged: {
            if(anim){
                if(!running){
                    nextAction();
                }
            }
        }
    }


    SequentialAnimation {
        id:randomIn;

        ParallelAnimation{
            NumberAnimation {target: anim.mTarget;properties: "y";to: (640-target_height)/2;duration: 800;
                easing.type: Easing.OutElastic;easing.amplitude: 1.0;easing.period: 0.8 }
            NumberAnimation {target: anim.mTarget;properties: "x";to: (1136-target_width)/2;duration: 800;
                easing.type: Easing.OutElastic;easing.amplitude: 1.0;easing.period: 0.8 }
        }
        onRunningChanged: {
            if(anim){
                if(!running){
                    nextAction();
                }
            }
        }
    }

    SequentialAnimation{
        id:upRoop
        loops: Animation.Infinite
        ParallelAnimation{
            NumberAnimation {target: anim.mTarget;properties: "x";from:(1136-target_width)/2; to: (1136-target_width)/2-10;duration: 600 }
            RotationAnimation{target:anim.mTarget;from:0;to:-2;duration:600}
        }
        ParallelAnimation{
            NumberAnimation {target: anim.mTarget;properties: "x";from:(1136-target_width)/2-10; to: (1136-target_width)/2+10;duration: 1200 }
            RotationAnimation{target:anim.mTarget;from:-2;to:2;duration:1200}
        }
        ParallelAnimation{
            NumberAnimation {target: anim.mTarget;properties: "x";from:(1136-target_width)/2+10; to: (1136-target_width)/2;duration: 600 }
            RotationAnimation{target:anim.mTarget;from:2;to:0;duration:600}
        }


    }

    SequentialAnimation {
        id:upIn;
        ParallelAnimation{
            NumberAnimation {target: anim.mTarget;properties: "opacity";from: 0.0;to: 1.0;duration: 500}
            SequentialAnimation {
                ScaleAnimator{target: anim.mTarget;from: 0.0;to: 1.5;duration: 400}
                ScaleAnimator{target: anim.mTarget;from: 1.5;to: 1;duration: 200}
            }
            RotationAnimation { target: anim.mTarget;from: -360;  to: 0; duration: 1500;
                easing.type: Easing.OutElastic;easing.amplitude: 1.5;easing.period: 1.2}
            NumberAnimation {target: anim.mTarget;properties: "y";from: 640;to: (640-target_height)/2;duration: 800;
                easing.type: Easing.OutElastic;easing.amplitude: 1.0;easing.period: 0.8 }
        }
        onRunningChanged: {
            if(anim){
                if(!running){
                    nextAction();
                }
            }
        }
    }

    SequentialAnimation {
        id:scaleIn;
        ParallelAnimation{
            NumberAnimation {target: anim.mTarget;properties: "opacity";from: 0.0;to: 1.0;duration: 300}
            ScaleAnimator{target: anim.mTarget;from: 0.0;to: 1.0;duration: 600;
                easing.type: Easing.OutElastic;easing.amplitude: 1.0;easing.period: 0.8 }
        }
        onRunningChanged: {
            if(anim){
                if(!running){
                    nextAction();
                }
            }
        }
    }

}
