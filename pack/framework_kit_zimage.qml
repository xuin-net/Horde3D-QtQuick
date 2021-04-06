import QtQuick 2.5

Item {
    id:baseItem;
    property string source: "";
    property double duration: 0;

    width:image.width;
    height: image.height;

    anchors.centerIn: parent;



    Item{
        id:make;
        width:0;
        height:image.height;
        clip:true;



        Image {
            id: image

            source: baseItem.source;

            onWidthChanged:{ 
                parent.width = width;
            }
        }


        Behavior on width {
            PropertyAnimation {
                duration: baseItem.duration;
            }
        }


    }
}
