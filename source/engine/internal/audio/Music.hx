package engine.internal.audio;

import flixel.sound.FlxSoundGroup;

class Music{
    public static function play_(path:String, ?lib:String, ?vol = 1.0, ?looped = false, ?onComplete:Void->Void, autoDestroy = false, ?group:FlxSoundGroup){
        return FlxG.sound.playMusic(Paths.music(path, lib), vol, looped, group);
    }
}