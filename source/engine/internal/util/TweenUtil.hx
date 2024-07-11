package engine.internal.util;

import flixel.tweens.misc.ColorTween;
import flixel.FlxSprite;
import flixel.tweens.misc.VarTween;
import flixel.tweens.misc.AngleTween;
import flixel.tweens.FlxTween;

class TweenUtil extends FlxTween{
    public static function pause(tween:FlxTween):Void{
        if (tween != null)
          tween.active = false;
    }
    
    public static function resume(tween:FlxTween):Void{
        if (tween != null)
          tween.active = true;
    }
    
    public static function pauseOf(object:Dynamic, ?paths:Array<String>):Void{
        @:privateAccess
        FlxTween.globalManager.forEachTweensOf(object, paths, pause);
    }
    
    public static function resumeOf(object:Dynamic, ?paths:Array<String>):Void{
        @:privateAccess
        FlxTween.globalManager.forEachTweensOf(object, paths, resume);
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
	 * TweenUtil.tween(object, {x: 0, y: 0, "scale.x": 1}, 1.0, {ease: TweenOptionUtil.getEase('easeName'), onStart: onStart, onUpdate: onUpdate, onComplete: onComplete, type: TweenOptionUtil.getType('typeName')});
	 * ```
	 *
	 * @param	object		The object containing the properties to tween.
	 * @param	values		An object containing key/value pairs of properties and target values.
	 * @param	duration	Duration of the tween in seconds.
	 * @param	options		A structure with tween options.
	*/
    public static function tween(object:Dynamic, values:Dynamic, ?duration:Float, ?options:TweenOptions):VarTween{
        return FlxTween.tween(object, values, duration, options);
    }

    /**
	 * Tweens numeric value which represents angle. Shorthand for creating a AngleTween object, starting it and adding it to the TweenManager.
	 *
	 * ```haxe
	 * TweenUtil.angle(sprite, [-90, 90], 2.0, {ease: TweenOptionUtil.getEase('easeName'), onStart: onStart, onUpdate: onUpdate, onComplete: onComplete, type: TweenOptionUtil.getType('typeName')});
	 * ```
	 *
	 * @param	sprite		Optional Sprite whose angle should be tweened.
	 * @param	from_to[0]  fromAngle	Start angle.
	 * @param	from_to[1]  toAngle		End angle.
	 * @param	duration	Duration of the tween.
	 * @param	options		A structure with tween options.
	*/
	public static function angle(?sprite:FlxSprite, from_to:Array<Null<Float>>, ?duration:Float, ?options:TweenOptions):AngleTween{
        var i = from_to;
        var result:Array<Float> = [0, 0];
        if (i[0] != null)
            result[0] = i[0];

        if (i[1] != null)
            result[1] = i[1];

		return FlxTween.angle(sprite, result[0], result[1], duration, options);
	}
    /**
	 * Tweens numeric value which represents color. Shorthand for creating a ColorTween object, starting it and adding it to a TweenPlugin.
	 *
	 * ```haxe
	 * TweenUtil.color(sprite, 0x000000, 0xffffff, 2.0, {ease: TweenOptionUtil.getEase('easeName'), onStart: onStart, onUpdate: onUpdate, onComplete: onComplete, type: TweenOptionUtil.getType('typeName')});
	 * ```
	 *
	 * @param	sprite		Optional Sprite whose color should be tweened.
	 * @param	duration	Duration of the tween in seconds.
     * @param	from_to[0]  fromColor	Start color.
	 * @param	from_to[1]  toColor		End Color.
	 * @param	options		A structure with tween options.
	*/
    public static function color(?sprite:FlxSprite, from_to:Array<String>, ?duration:Float, ?options:TweenOptions):ColorTween{
        return FlxTween.color(sprite, duration, ColorsUtil.getColor(from_to[0]), ColorsUtil.getColor(from_to[1]), options);
    }
}