package engine.internal.song;

class SongTime implements ICloneable<SongTime>{
  public static final defaultTime:SongTime = new SongTime(0, 100);

  public static final songChange:Array<SongTime> = [defaultTime];

  static final beat_tuplets:Array<Int> = [4, 4, 4, 4]; // Default Tuplets
  static final beat_time:Null<Float> = null; // Later, null gets detected and recalculated.

  /**
   * FloorTime in specified `timeFormat`.
  */
  @:alias("step")
  public var floorTime:Float;

  /**
   * Time in beats (int). The game will calculate further beat values based on this one,
   * so it can do it in a simple linear fashion.
  */
  @:optional
  @:alias("beat")
  public var beatTime:Null<Float>;

  /**
   * Quarter notes per minute (float). Cannot be empty in the first element of the list,
   * but otherwise it's optional, and defaults to the value of the previous element.
  */
  @:alias("bpm")
  public var bpm:Float;

  /**
   * Time signature numerator (int). Optional, defaults to 4.
  */
  @:default(4)
  @:optional
  @:alias("sigNum")
  public var signatureNum:Int;

  /**
   * Time signature denominator (int). Optional, defaults to 4. Should only ever be a power of two.
  */
  @:default(4)
  @:optional
  @:alias("sigDen")
  public var signatureDen:Int;

  /**
   * Beat tuplets (Array<int> or int). This defines how many steps each beat is divided into.
   * It can either be an array of length `n` (see above) or a single integer number.
   * Optional, defaults to `[4]`.
  */
  @:optional
  @:alias("beatTup")
  public var beatTuplets:Null<Array<Int>>;

  public function new(time:Float, bpm:Float, signatureNum = 4, signatureDen = 4, ?beat:Float, ?beatTuplets:Array<Int>){
    this.floorTime = time;
    this.bpm = bpm;

    this.signatureNum = signatureNum;
    this.signatureDen = signatureDen;
    this.beatTime = beatTime == null ? beat_time : beatTime;
    this.beatTuplets = beatTuplets == null ? beat_tuplets : beatTuplets;
  }
  public function clone():SongTime{
    return new SongTime(this.floorTime, this.bpm, this.signatureNum, this.signatureDen, this.beatTime, this.beatTuplets);
  }

  /**
   * Produces a string representation suitable for debugging.
  */
  /*public function toString():String{
    return 'SongTime(${this.timeStamp}ms,${this.bpm}bpm)';
  }*/
}