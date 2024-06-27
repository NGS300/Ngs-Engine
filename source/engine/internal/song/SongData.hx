package engine.internal.song;

class SongData implements ICloneable<SongData>{
    @:optional
    @:default(false)
    public var unlockSongThing:Bool;

    @:optional
    @:default('')
    public var characters:Map<String, String>; // Characters

    @:optional
    @:default([])
    public var vocalsVol:Map<String, Float>; // Vocals

    @:optional
    @:default([''])
    public var instVol:Map<String, Float>; // Instrumental

    @:optional
    @:default([])
    public var alt:Array<String> = []; // Instrumental_ALT

    public function new(canSong = false){
        unlockSongThing = canSong;
        this.characters = SongChar.characters;
        if (unlockSongThing){
            this.vocalsVol = Song.vocalsVol;
            this.instVol = Song.instVol;
            this.alt = Song.alt;
        }
        Song.reload();
    }
    public function clone():SongData{
        var result:SongData = new SongData();
        result.unlockSongThing = this.unlockSongThing;
        result.alt = this.alt.clone();
        Song.reload();
        return result;
    }

    /**
     * Produces a string representation suitable for debugging.
     */
    /*public function toString():String{
        return 'SongData(${this.player}, ${this.girlfriend}, ${this.opponent}, ${this.instrumental}, [${this.altInstrumentals.join(', ')}])';
    }*/
}