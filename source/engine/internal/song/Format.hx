package engine.internal.song;

enum abstract TimeFormat(String) from String to String{
    var TI = 'ticks'; // TICKS
    var FL = 'float'; // FLOAT
    var MS = 'ms'; // MILLISECONDS
}

class Format{
    @:optional
    @:default("x.x.x")
    public var version:String;

    @:default("Unknown")
    public var songName:String;

    @:optional
    @:default("Unknown")
    public var artist:String;
    
    @:default("mainStage")
    public var stage:String;

    @:default(1.0)
    public var scrollspeed:Float;
}