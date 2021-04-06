import QtQuick 2.5
import com.K2D 1.0
Item {

    property var video: null;

    property string source: "";

    anchors.fill: parent;

    function onExit() {
        video.mediaStatusChanged.disconnect(videoSignal);
        K2D.stopMediaVideoPlayer();
    }

    onSourceChanged: {
        if(video == null){
            video = K2D.createMediaVideoPlayer(source);
			video.mediaStatusChanged.connect(videoSignal);
        }
        video.play();
    }

    function videoSignal(status){
        if(status == 6){
            console.log("开始播放视频：",source);
        }
        if(status == 7){
            console.log("视频播放结束！");
            //video.player.push();
        }
    }

}
