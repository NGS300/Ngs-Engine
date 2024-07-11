package engine.internal.song;

/*typedef SwagSection ={
	var sectionNotes:Array<Dynamic>;
	var speakerSection:Bool;
	var mustHitSection:Bool;
	var lengthInSteps:Int;
	var typeOfSection:Int;
	var changeBPM:Bool;
	var altAnim:Bool;
	var altTwoAnim:Bool;
	var bpm:Float;
}*/

typedef Section = {
	var secBeat:Float;
    var bpm:Float;
	var num:Int;
}

typedef Event = {
	var id:Array<Dynamic>; // Notes
}

class SectionFormat{
	public var secBeat:Float = 4;
	public function new(beat:Float = 4){
		this.secBeat = beat;
	}
}