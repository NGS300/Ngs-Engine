package engine.internal.song;

class SongChar extends Persist{
    @:optional
    @:default([''])
    public static var characters:Map<String, String>;
    public static function reload(){
        characters = Persist.song.characters;
    }
}