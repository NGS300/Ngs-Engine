package engine.internal.song;

typedef EventBPM = {
	var step:Int;
	var time:Float;
	var bpm:Float;
	@:optional var crochet:Float;
}
class Conductor{
	public static var bpm:Float = 100;
	public static var crochet:Float = ((60 / bpm) * 1000); // beats in milliseconds
	public static var stepCrochet:Float = crochet / 4; // steps in milliseconds
	public static var songPosition:Float;
	public static var lastSongPos:Float;

	
	//public static var safeFrames:Int = 10;
	//public static var safeZoneOffset:Float = Math.floor((Client.safeFrames / 60) * 1000);
	//public static var timeScale:Float = safeZoneOffset / 166;
	public static var mapBPM:Array<EventBPM> = [];
	public function new(){}

	/*public static function recalculateTimings(){
		Conductor.safeFrames = FlxG.save.data.frames;
		Conductor.safeZoneOffset = Math.floor((Conductor.safeFrames / 60) * 1000);
		Conductor.timeScale = Conductor.safeZoneOffset / 166;
	}*/

	public static function getTimeCrochet(time:Float){
		var last = getBPM(time);
		return last.crochet * 4;
	}

	public static function getStep(time:Float, isRounded:Bool){
		var last = getBPM(time);
		var calc = (time - last.time) / last.crochet;
		var result = last.step + (!isRounded ? calc : Math.floor(calc));
		return result;
	}

	public static function getBeat(time:Float, isRounded:Bool){
		return getStep(time, isRounded) / 4;
	}

	public static function secondsBeat(beat:Float):Float{
		var step = beat * 4;
		var last = getBPM(beat, false);
		return last.time + ((step - last.step) / (last.bpm / 60) / 4) * 1000;
	}

	/**
	 * [Get BPM Value]
	 * @param value get `time` or `step` value
	 * @param isTime set mode `true: iTime` or ` false: isStep`.
	*/
	public static function getBPM(value:Float, isTime = true){
		var result = true;
		if (isTime)
			result = true;
		else
			result = false;

		var last:EventBPM = {
			step: 0,
			time: 0,
			bpm: bpm,
			crochet: stepCrochet
		}
		for (i in 0...Conductor.mapBPM.length){
			var conduc = Conductor.mapBPM[i];
			var property = (result ? value >= conduc.time : conduc.step <= value);
			if (property)
				last = Conductor.mapBPM[i];
		}

		return last;
	}

	inline public static function calcCrochet(b:Float):Float{
		return ((60 / b) * 1000);
	}

	public static function setBPM(BPM:Float){
		var b = BPM;
		bpm = b;
		crochet = calcCrochet(b);
		stepCrochet = crochet / 4;
		Debug.log('current BPM: $b');
	}

	public static function changesBPMMap(song:SongFormat.Song, sec:SongFormat.Note){
		mapBPM = [];
		var BPM:Float = song.type.get('bpm');
		var totalSteps:Int = 0;
		var totalPos:Float = 0;
		for (i in 0...sec.sections.length){
			if (sec.sections[i].bpm != BPM){
				BPM = sec.sections[i].bpm;
				var event:EventBPM = {
					step: 0,
					time: 0,
					bpm: BPM,
					crochet: calcCrochet(BPM) / 4
				};
				mapBPM.push(event);
			}
			var length:Int = getSection(sec, i);
			totalSteps += length;
			totalPos += (calcCrochet(BPM) / 4) * length;
			Debug.log('New Map BPM $mapBPM');
		}
	}

	static function getSection(sec:SongFormat.Note, section:Int){
		var value:Null<Float> = null;
		if (sec.sections[section] != null)
			value = sec.sections[section].secBeat;
		var result = (value != null ? value : 4);
		return Math.round(result);
	}
}