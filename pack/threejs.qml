import QtQuick 2.0
import QtQuick.Controls 2.1
import QtCanvas3D 1.0

import "./" as L
import "animation-skinning-blending.js" as GLCode

L.K2D_BaseGame  {
    id: mainview
    visible: true

    // Parameters that must be updated per frame from the GUI to the animation code
    Item{
        id: guiInputParameters
        property real timeScale: 0.8
    }

    function parsingCode(codeObj){
        exitScreen(codeObj);
    }

    //    Rectangle {
//        id: guiInputParameters
//        width: 200;
//        height: 100;
//        radius: 10;
//        opacity: 0.7;
//        color: "LightGray";
//        anchors.bottom: parent.bottom;
//        anchors.right: parent.right;

//        z: 1000;
//        property real timeScale: 1.0
//        Button{
//            id: tempButton
//            onClicked: {
//                GLCode.onStartAnimation();
//            }
//        }
//    }

    /*
    TODO: GUI rewrite as QtQuick
    window.addEventListener( 'start-animation', onStartAnimation );
    window.addEventListener( 'stop-animation', onStopAnimation );
    window.addEventListener( 'pause-animation', onPauseAnimation );
    window.addEventListener( 'step-animation', onStepAnimation );
    window.addEventListener( 'weight-animation', onWeightAnimation );
    window.addEventListener( 'crossfade', onCrossfade );
    window.addEventListener( 'warp', onWarp );
    window.addEventListener( 'toggle-show-skeleton', onShowSkeleton );
    window.addEventListener( 'toggle-show-model', onShowModel );
    */


    Canvas3D {
        id: canvas3d
        anchors.fill: parent

        Text {
            anchors.horizontalCenter: parent.horizontalCenter;
            text: "FPS: " + canvas3d.fps;
            font.bold: true;
            color: "snow"
            font.pointSize: 30;
        }

        Component.onCompleted: {
            delayTimer.start();
        }

        // Emitted when one time initializations should happen
        onInitializeGL: {
            GLCode.initializeGL(canvas3d, eventSource);
        }

        // Emitted each time Canvas3D is ready for a new frame
        onPaintGL: {
            GLCode.paintGL(canvas3d, guiInputParameters);
        }

        onResizeGL: {
            GLCode.onResizeGL(canvas3d);
        }

        ControlEventSource {
            id: eventSource
            anchors.fill: parent
            focus: true
        }
    }

    Timer{
        id: delayTimer;
        interval: 50;repeat: false;
        onTriggered: {
            GLCode.onStartAnimation();
        }
    }

}
