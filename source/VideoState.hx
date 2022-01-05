package;

import MusicBeatState;
import VideoPlayer;
import flixel.*;
import flixel.text.FlxText;

class VideoState extends MusicBeatState {
    var nextState:FlxState;
    var source:String = "videos/";
    var sizething:Bool;

    public function new(fileName:String = "ass",trans:FlxState, ?multiplySize:Bool = false) {
        nextState = trans;
        source = fileName;
        sizething = multiplySize;
        super();
    }
    override function create() {
        FlxG.sound.music.stop();
        var video = new VideoPlayer(0, 0, source);
		video.finishCallback = () -> {
			remove(video);
            LoadingState.loadAndSwitchState(nextState);
		}
		video.ownCamera();
        video.setGraphicSize(FlxG.width);
		video.updateHitbox();
		add(video);
		video.play();

        super.create();
    }
    override function update(elapsed:Float) {
        super.update(elapsed);

        for (touch in FlxG.touches.list)
        {
            if (touch.justPressed)
            {
                LoadingState.loadAndSwitchState(nextState);
            }
        }
        if (controls.ACCEPT)
        {
            LoadingState.loadAndSwitchState(nextState);
        }
    }
}