import QtQuick 2.5
import com.K2D 1.0
import QtMultimedia 5.5

Item {
    id:self;

    Image {
        source: K2D.image("index.png");
    }
	
	property bool isPlayerbgSound: true;

    Timer {
        interval: 300; running: true; repeat: false
        onTriggered: {
			if(isPlayerbgSound){
				K2D.playSound("index.mp3");
			}
        }
    }

}
