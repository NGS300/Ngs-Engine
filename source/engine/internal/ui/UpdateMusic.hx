package engine.internal.ui;
import flixel.addons.ui.FlxUIState;
class UpdateMusic extends FlxUIState{
    private var lengthSec = 16;
	private var curStep = 0;
	private var curBeat = 0;
	private var curSec = 0;
    override function create(){super.create();}
    override function update(elapsed:Float){
        updateCurStep();
		updateBeat();
        super.update(elapsed);
    }
    private function updateCurStep(){
        
    }
    private function updateBeat(){

	}
    public function stepHit(){
		if (curStep % 4 == 0)
			beatHit();
	}
	public function beatHit(){}
	public function sectionHit(){}
}