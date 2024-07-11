package engine.internal.audio;

import flixel.sound.FlxSound;
import flixel.sound.FlxSoundGroup;

class Sound extends FlxSound{
    public function new(path:String, ?lib:String, ?vol = 1.0, ?looped = false, ?isSound = true, ?onComplete:Void->Void, autoDestroy = false){
        super();
        var result = (isSound ? Paths.sound(path, lib) : Paths.music(path, lib));
        loadEmbedded(result, looped, autoDestroy, onComplete);
        this.volume = vol;
    }

    public static function play_(path:String, ?lib:String, ?vol = 1.0, ?looped = false, ?onComplete:Void->Void, autoDestroy = false, ?group:FlxSoundGroup){
        FlxG.sound.play(Paths.sound(path, lib), vol, looped, group, autoDestroy, onComplete);
    }
}