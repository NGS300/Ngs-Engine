package engine.internal.objects;

import engine.internal.util.ColorsUtil;
import flixel.util.FlxAxes;
import flixel.FlxCamera;

class Camera extends FlxCamera{
    public function new(){
        super(0, 0, 0, 0, 0); // Usuless
    }

    public function Flash(color = 'white', duration:Float = 1, ?onComplete:() -> Void, force = false){
        super.flash(ColorsUtil.getColor(color), duration, onComplete, force);
    }

    /**
     * [Screen Shake Effect]
     * @param value[0] Percentage of screen size representing the maximum distance
	 *                 that the screen can move while shaking.
     * @param value[1] The length in seconds that the shaking effect should last.
     * @param onComplete A function you want to run when the shake effect finishes.
     * @param force Force the effect to reset (default = `true`, unlike `flash()` and `fade()`!)
     * @param axes On what axes to shake. Default value is `'XY'` / both.
    */
    public function Shake(value:Array<Null<Float>>, ?onComplete:() -> Void, force = true, axes = 'XY'){
        var i = value;
        var result:Array<Float> = [0, 0];
        if (i[0] != null || i[0] != 0)
            result[0] = i[0];
        else
            result[0] = 0.05;

        if (i[1] != null || i[1] != 0)
            result[1] = i[1];
        else
            result[1] = 0.5;

        var i = axes;
        var id:FlxAxes;
        if (i == 'XY')
            id = XY;
        else if (i == 'X')
            id = X;
        else if (i == 'Y')
            id = Y;
        else
            id = NONE;
        
        super.shake(result[0], result[1], onComplete, force, id);
    }
}