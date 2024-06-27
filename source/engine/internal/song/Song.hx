package engine.internal.song;

class Song{
    @:optional
    @:default([''])
    public static var vocalsVol:Map<String, Float>;

    @:optional
    @:default([''])
    public static var vocals:Map<String, String>;

    @:optional
    @:default('')
    public static var instVol:Map<String, Float>;

    @:optional
    @:default('')
    public static var inst:Map<String, String>;

    @:optional
    @:default([''])
    public static var alt:Array<String>;
    public static function reload(){
        vocalsVol = Persist.song.vocalsVol;
        vocals = Persist.song.vocals;
        instVol = Persist.song.instVol;
        inst = Persist.song.inst;
        alt = Persist.song.altInst;
    }
}