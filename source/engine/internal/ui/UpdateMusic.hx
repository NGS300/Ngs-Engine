package engine.internal.ui;

import flixel.math.FlxMath;
import engine.internal.util.MathUtil;
import engine.internal.objects.EngineCamera;
import engine.internal.song.Conductor;
import flixel.addons.ui.FlxUIState;

class UpdateMusic extends FlxUIState{
    private var cameraInit = false;
    private var section = 0;
	private var stepToDo = 0;

	private var step = 0;
	private var beat = 0;

	/**
	 * Decimal Step
	*/
	private var decStep:Float = 0;

	/**
	 * Decimal Beat 
	*/
	private var decBeat:Float = 0;
    override function create(){
        if (!cameraInit)
            initCamera();
        super.create();
    }

    public function initCamera():EngineCamera{
		var camera = new EngineCamera();
		FlxG.cameras.reset(camera);
		FlxG.cameras.setDefaultDrawTarget(camera, true);
		cameraInit = true;
		//Debug.log('initialized engine camera ' + Sys.cpuTime());
		return camera;
	}

    override function update(elapsed:Float){
        var oldStep:Int = step;
        updateStep();
		updateBeat();
        if (oldStep != step){
			if (step > 0)
				stepHit();
        }
        super.update(elapsed);
    }

    private function updateBeat(){
        beat = Math.floor(step / 4);
		decBeat = decStep / 4;
	}

    private function updateStep(){
       var last = Conductor.getBPM(Conductor.songPosition);
		var result = ((Conductor.songPosition - 0) - last.time) / last.crochet;
		decStep = last.step + result;
		step = last.step + Math.floor(result);
    }

    private function updateSection(rollBack = false){
        /*if (!rollBack){
            if (stepToDo < 1) stepToDo = Math.round(getBeatSection() * 4);
            while (step >= stepToDo){
                section++;
                var beat:Float = getBeatSection();
                stepToDo += Math.round(beat * 4);
                sectionHit();
            }
        }else{
            if (step < 0) return;
            var last:Int = section;
            section = 0;
            stepToDo = 0;
            for (i in 0...PlayState.SONG.notes.length){
                if (PlayState.SONG.notes[i] != null){
                    stepToDo += Math.round(getBeatSection() * 4);
                    if (stepToDo > step) break;                    
                    section++;
                }
            }
    
            if (section > last) sectionHit();
        }*/
    }
    

    public function stepHit(){
		if (step % 4 == 0)
			beatHit();
	}

	public function beatHit(){}

	public function sectionHit(){}

    /*function getBeatSection(){
		var value:Null<Float> = null;
		if (sec.sections[section] != null)
			value = sec.sections[section].secBeat;
		var result = (value != null ? value : 4);
		return Math.round(result);
	}*/

    public function switchState(nextStage:String){
        Transitionable.switchStateByName(nextStage);
    }
}