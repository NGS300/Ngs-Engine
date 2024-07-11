package engine.internal.objects;

import engine.internal.util.ColorsUtil;
import flixel.math.FlxPoint;
import flixel.FlxSprite;

class EngineCamera extends Camera{

	/**
	 * The screen is filled with this color and gradually returns to normal.
	 *
	 * @param   color        The color you want to use in `String`.
	 * @param   duration     How long it takes for the flash to fade.
	 * @param   onComplete   A function you want to run when the flash finishes.
	 * @param   force        Force the effect to reset.
	*/
	public static function flash_(color = 'black', ?duration:Float, ?onComplete:Void->Void, ?force){
		FlxG.camera.flash(ColorsUtil.getColor(color), duration, onComplete, force);
	}

	/**
	 * The screen is gradually filled with this color.
	 *
	 * @param   color        The color you want to use in `String`.
	 * @param   duration     How long it takes for the fade to finish.
	 * @param   onComplete   A function you want to run when the fade finishes.
	 * @param   fadeIn       `true` fades from a color, `false` fades to it.
	 * @param   force        Force the effect to reset.
	*/
	public static function fade_(color = 'black', ?duration:Float, ?onComplete:Void->Void, ?fadeIn, ?force):Void{
		FlxG.camera.fade(ColorsUtil.getColor(color), duration, fadeIn, onComplete, force);
	}

    override function update(elapsed:Float){
        super.update(elapsed);
        if (target != null)
			updateNewFollow(elapsed);

		updateScroll();
		updateFlash(elapsed);
		updateFade(elapsed);

		flashSprite.filters = filtersEnabled ? filters : null;
		updateFlashSpritePosition();
		updateShake(elapsed);
    }
    public function updateNewFollow(?elapsed:Float = 0):Void{
		if (deadzone == null){
			target.getMidpoint(_point);
			_point.addPoint(targetOffset);
			_scrollTarget.set(_point.x - width * 0.5, _point.y - height * 0.5);
		}else{
			var edge:Float;
			var targetX:Float = target.x + targetOffset.x;
			var targetY:Float = target.y + targetOffset.y;
			if (style == SCREEN_BY_SCREEN){
				if (targetX >= viewRight)
					_scrollTarget.x += viewWidth;
				else if (targetX + target.width < viewLeft)
					_scrollTarget.x -= viewWidth;

				if (targetY >= viewBottom)
					_scrollTarget.y += viewHeight;
				else if (targetY + target.height < viewTop)
					_scrollTarget.y -= viewHeight;
				
				bindScrollPos(_scrollTarget); // without this we see weird behavior when switching to SCREEN_BY_SCREEN at arbitrary scroll positions
			}else{
				edge = targetX - deadzone.x;
				if (_scrollTarget.x > edge)
					_scrollTarget.x = edge;

				edge = targetX + target.width - deadzone.x - deadzone.width;
				if (_scrollTarget.x < edge)
					_scrollTarget.x = edge;

				edge = targetY - deadzone.y;
				if (_scrollTarget.y > edge)
					_scrollTarget.y = edge;

				edge = targetY + target.height - deadzone.y - deadzone.height;
				if (_scrollTarget.y < edge)
					_scrollTarget.y = edge;
			}

			if ((target is FlxSprite)){
				if (_lastTargetPosition == null)
					_lastTargetPosition = FlxPoint.get(target.x, target.y); // Creates this point.

				_scrollTarget.x += (target.x - _lastTargetPosition.x) * followLead.x;
				_scrollTarget.y += (target.y - _lastTargetPosition.y) * followLead.y;

				_lastTargetPosition.x = target.x;
				_lastTargetPosition.y = target.y;
			}
		}

		var mult:Float = 1 - Math.exp(-elapsed * followLerp);
		scroll.x += (_scrollTarget.x - scroll.x) * mult;
		scroll.y += (_scrollTarget.y - scroll.y) * mult;
	}
	override function set_followLerp(value:Float){
		return followLerp = value;
	}
}