package engine.internal.util;

import flixel.tweens.misc.VarTween;
import flixel.tweens.FlxTween;

class TweenUtil extends FlxTween{
    public var Tween:FlxTween;

    public static function pause(tween:FlxTween):Void{
        if (tween != null)
          tween.active = false;
    }
    
    public static function resume(tween:FlxTween):Void{
        if (tween != null)
          tween.active = true;
    }
    
    public static function pauseOf(Object:Dynamic, ?FieldPaths:Array<String>):Void{
        @:privateAccess
        FlxTween.globalManager.forEachTweensOf(Object, FieldPaths, pause);
    }
    
    public static function resumeOf(Object:Dynamic, ?FieldPaths:Array<String>):Void{
        @:privateAccess
        FlxTween.globalManager.forEachTweensOf(Object, FieldPaths, resume);
    }

    public static function onFunction(func){
        return function(tmr:FlxTween){
            func();
        };
    }

    /**
     * [Y Position]
     * 
     * [`Y`] goes up & [`-Y`] goes down
     * @param y Position `[x, y]`
    */
    public static function y(y:Float):Float{
        return (y > 0 ? - y : - y);
    }

    /**
	 * Tweens numeric public properties of an Object
	 *
	 * ```haxe
	 * TweenUtil.tween(Object, {x: 0, y: 0, "scale.x": 1}, 1.0, {ease: getEase('easeName'), onStart: onStart, onUpdate: onUpdate, onComplete: onComplete, type: ONESHOT});
	 * ```
	 *
	 * @param	Object		The object containing the properties to tween.
	 * @param	Values		An object containing key/value pairs of properties and target values.
	 * @param	Duration	Duration of the tween in seconds.
	 * @param	Options		A structure with tween options.
	*/
    public static function tween(Object:Dynamic, Values:Dynamic, ?Duration:Float, ?Options:TweenOptions):VarTween{
        return FlxTween.tween(Object, Values, Duration, Options);
    }
}