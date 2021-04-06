import QtQuick 2.7
import QtQuick.Controls 2.0
import Horde3D 1.0

ApplicationWindow {
    id: name
    visible: true;
    width: 1136;
    height: 640;

    Loader{
        id: loader;
        anchors.fill: parent;
    }

    Column{
        spacing: 20;
        Repeater {
            model: 6;
            delegate: Button {
                text: "model_" + String(index+1)
                onClicked: loader.source = "qrc:/model_"+String(index+1)+".qml"
            }
        }
    }
}
