import QtQuick 2.0
import com.K2D 1.0
Item {
    id:winLayer
    
    anchors.fill: parent;

    function init(){
        var spine = K2D.qml("framework_kit_spine.qml",winLayer);
        spine.centerInParent();
        spine.init("jz","jz_1",false);
        spine.addAnimation(1,"jz_2",true);

        K2D.playSound("gamewin.mp3");
    }


    Rectangle{
        anchors.fill: parent;
        color:Qt.rgba(0,0,0,0.4);
    }

}
