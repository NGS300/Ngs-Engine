package engine.internal.util;
import flixel.tweens.FlxEase;

class EaseUtil extends FlxEase{
  /**
  * [Tween Ease name]
  * @param ease Ease name in String
  */
  public static function getEase(?ease:String):(t:Float) -> Float{
    var i:(t:Float) -> Float = FlxEase.linear;
		switch (ease){
			case 'linear': i = FlxEase.linear;
			case 'backIn': i =  FlxEase.backIn;
			case 'backOut': i =  FlxEase.backOut;
			case 'backInOut': i =  FlxEase.backInOut;
			case 'bounceIn': i =  FlxEase.bounceIn;
			case 'bounceOut': i =  FlxEase.bounceOut;
			case 'bounceInOut': i =  FlxEase.bounceInOut;
			case 'circIn': i =  FlxEase.circIn;
			case 'circOut': i =  FlxEase.circOut;
			case 'circInOut': i =  FlxEase.circInOut;
			case 'cubeIn': i =  FlxEase.cubeIn;
			case 'cubeOut': i =  FlxEase.cubeOut;
			case 'cubeInOut': i =  FlxEase.cubeInOut;
			case 'elasticIn': i =  FlxEase.elasticIn;
			case 'elasticOut': i =  FlxEase.elasticOut;
			case 'elasticInOut': i =  FlxEase.elasticInOut;
			case 'expoIn': i = FlxEase.expoIn;
			case 'expoOut': i = FlxEase.expoOut;
			case 'expoInOut': i = FlxEase.expoInOut;
			case 'quadIn': i = FlxEase.quadIn;
			case 'quadOut': i = FlxEase.quadOut;
			case 'quadInOut': i = FlxEase.quadInOut;
			case 'quartIn': i = FlxEase.quartIn;
			case 'quartOut': i = FlxEase.quartOut;
			case 'quartInOut': i = FlxEase.quartInOut;
			case 'quintIn': i = FlxEase.quintIn;
			case 'quintOut': i = FlxEase.quintOut;
			case 'quintInOut': i = FlxEase.quintInOut;
			case 'sineIn': i = FlxEase.sineIn;
			case 'sineOut': i = FlxEase.sineOut;
			case 'sineInOut': i = FlxEase.sineInOut;
			case 'smoothStepIn': i = FlxEase.smoothStepIn;
			case 'smoothStepOut': i = FlxEase.smoothStepInOut;
			case 'smoothStepInOut': i = FlxEase.smoothStepInOut;
			case 'smootherStepIn': i = FlxEase.smootherStepIn;
			case 'smootherStepOut': i = FlxEase.smootherStepOut;
			case 'smootherStepInoOt': i = FlxEase.smootherStepInOut;
		}
		return i;
	}
}