import QtQuick 2.0
import com.Spine 1.0
import com.K2D 1.0

Spine{
    id: root

    Behavior on y {
        enabled: y!=0;
        PropertyAnimation {
            duration: moveDuration;
        }
    }


    Behavior on x {
        enabled: x!=0
        PropertyAnimation {
            duration: moveDuration;
        }
    }
}
