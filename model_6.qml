import QtQuick 2.0
import QtQuick.Controls 2.0
import Horde3D 1.0

Item{
    width: 1136;
    height: 640;
    Horde3D{
        id: view3D;
        anchors.fill: parent;
        fileName: "microwave";
    }
}


