package engine.external.state;

import engine.internal.audio.Sound;
import engine.internal.objects.EngineCamera;
import engine.internal.util.MathUtil;
import flixel.util.FlxColor;
import engine.internal.audio.Music;
import engine.internal.graphics.Sprite;
import openfl.Assets;
import engine.internal.objects.Alphabet;
import flixel.group.FlxGroup;
import engine.internal.objects.Camera;
import engine.internal.util.TimerUtil;
import engine.internal.graphics.Graphics;
import engine.internal.util.TweenUtil;
import engine.internal.util.TweenOptionUtil;
import engine.internal.graphics.AnimatedSprite;
import engine.internal.song.Conductor;
import engine.internal.ui.UpdateMusic;

class Title extends UpdateMusic{
	public static var initialized = false;
	public static var closedTitle = false;
	var curWacky:Array<String> = [];
	var credGroup:FlxGroup;
	var textGroup:FlxGroup;
	var downGradient:Sprite;
	var upGradient:Sprite;
	var blackScreen:Graphics;
	var logo:AnimatedSprite;
	var text:AnimatedSprite;
	var credText:Alphabet;
	var ngeSpr:Sprite;
	var cam:Camera;
	var skippedIntro = false;
	var transition = false;
	var bePressed = false;
	var theBeats = 0;
	var newIntro = 0;
	override public function create(){
		cam = initCamera();
		FlxG.fixedTimestep = false;
		FlxG.game.focusLostFramerate = 30;
		curWacky = FlxG.random.getObject(getIntroText());
		super.create();

		if (!initialized){
			persistentUpdate = true;
			persistentDraw = true;
		}

		if (!initialized){
			TimerUtil.NewTimer(1, function(){
				startIntro();
			});
		}else
			startIntro();
	}

	function startIntro(){
		if (!initialized && FlxG.sound.music == null){
			Music.play_('themeMenu', 0,  true, false);
			/*var diamond = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;
			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1), {asset: diamond, width: 32, height: 32}, new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
			transIn = FlxTransitionableState.defaultTransIn;
			transOut = FlxTransitionableState.defaultTransOut;*/
		}
		Conductor.setBPM(102);
		persistentUpdate = true;

		var bg:Graphics;
		bg = new Graphics([FlxG.width, FlxG.height], 'black');
		add(bg);

		upGradient = new Sprite('title/gradient');
		upGradient.graphicSize([1880, 256], true);
		upGradient.position([0]);
		upGradient.flip([false, true]);
		upGradient.color_('0xFFff0000');
		upGradient.alpha_(0.31);
		TweenUtil.color(upGradient, ['0xFF680000', '0xFFff0000'], 2, {ease: TweenOptionUtil.getEase('quadInOut'), type: TweenOptionUtil.getType('pingpong')});
		add(upGradient);

		downGradient = new Sprite('title/gradient');
		downGradient.graphicSize([1880, 256], true);
		downGradient.position([0, 512]);
		downGradient.color_('0xFF680000');
		downGradient.alpha_(0.51);
		TweenUtil.color(downGradient, ['0xFFff0000', '0xFF680000'], 2, {ease: TweenOptionUtil.getEase('quadInOut'), type: TweenOptionUtil.getType('pingpong')});
		add(downGradient);

		logo = new AnimatedSprite('title/logo');
		logo.animaPrefix('bump', 'bumpin', false);
		logo.graphicSize([0.8, 0.8]);
		logo.play('bump');
		logo.center();
		TweenUtil.angle(logo, [-6, 6], 2, {ease: TweenOptionUtil.getEase('quadInOut'), type: TweenOptionUtil.getType('pingpong')});
		add(logo);

		// FlxG.height * (downscroll ? 0.8 : 0.09)
		text = new AnimatedSprite('title/titleEnter');
		text.position([180, FlxG.height * 0.09]);
		text.animaPrefix('idle', 'press0');
		text.animaPrefix('press', 'pressed0');
		text.play('idle');
		text.updateBox();
		add(text);

		credGroup = new FlxGroup();
		add(credGroup);
		textGroup = new FlxGroup();

		blackScreen = new Graphics([FlxG.width, FlxG.height], 'black');
		credGroup.add(blackScreen);

		credText = new Alphabet(0, 0, "", true);
		credText.screenCenter();
		credText.visible = false;

		ngeSpr = new Sprite();
		//add(ngeSpr);
		ngeSpr.visible_(false);
		ngeSpr.graphicSize([0.8]);
		ngeSpr.updateBox();
		ngeSpr.center();

		if (!initialized)
			initialized = true;
		else
			skipIntro();
	}

	function skipIntro(){
		if (!skippedIntro){
			//remove(ngSpr);
			remove(credGroup);
			remove(textGroup);
			EngineCamera.flash_('white', 4);
			skippedIntro = true;
		}
	}

	override function update(elapsed:Float){
		if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

        if (!bePressed)
			FlxG.camera.zoom = MathUtil.lerp(1, FlxG.camera.zoom, Math.exp(-elapsed * 3.125));

		if (FlxG.keys.justPressed.ENTER){
			if (!bePressed && !transition && skippedIntro){
				var ease = TweenOptionUtil.getEase;
				var type = TweenOptionUtil.getType;
				var onFuc = TweenUtil.onFunction;
				var camera = FlxG.camera;
				bePressed = true;
				text.play('press');
				// Sound.play_('confirmMenu', 0.7);
				camera.flash(FlxColor.WHITE);
				// Client.downscroll ? 1000 : -1000
				TweenUtil.tween(text, {y: TweenUtil.y(1000)}, 2.5, {ease: ease('backInOut'), type: type('persist'), onComplete: onFuc(function(){
					text.destroy();
				})});
				TimerUtil.NewTimer(0.5, function(){
					if (newIntro == 0){
						TimerUtil.NewTimer(2, function(){
							transition = true;
							state();
						});
						TweenUtil.tween(upGradient, {y: TweenUtil.y(500)}, 3.2, {ease: ease('quartInOut'), type: type('persist'), onComplete: onFuc(function(){
							upGradient.destroy();
						})});
						TweenUtil.tween(downGradient, {y: downGradient.y + 500}, 3.2, {ease: ease('quartInOut'), type: type('persist'), onComplete: onFuc(function(){
							downGradient.destroy();
						})});
						TweenUtil.tween(logo, {x: 1500}, 2.9, {ease: ease('backInOut'), type: type('persist')});
					}else{
						TimerUtil.NewTimer(0.5, function(){
							TweenUtil.tween(upGradient, {y: TweenUtil.y(500)}, 3.2, {ease: ease('quartInOut'), type: type('persist'), onComplete: onFuc(function(){
								upGradient.destroy();
							})});
							TweenUtil.tween(downGradient, {y: downGradient.y + 50}, 3.2, {ease: ease('quartInOut'), type: type('persist'), onComplete: onFuc(function(){
								downGradient.destroy();
							})});
							TweenUtil.tween(logo, {angle: 900}, 2.5, {ease: ease('backInOut'), type: type('persist')});
							TweenUtil.tween(camera, {zoom: 6}, 2, {ease: ease('quartInOut'), type: type('persist')});
							TweenUtil.tween(logo, {alpha: 0}, 2.2, {ease: ease('cubeOut'), type: type('persist')});
							TweenUtil.tween(upGradient, {alpha: 0}, 1.6, {ease: ease('cubeOut'), type: type('persist')});
							TweenUtil.tween(downGradient, {alpha: 0}, 1.6, {ease: ease('cubeOut'), type: type('persist'), onComplete: onFuc(function(){
								EngineCamera.fade_(0.25, function(){
									transition = true;
									state();
								});
							})});
						});
					}
				});
			}
			if (!skippedIntro && initialized)
				skipIntro();
		}
		super.update(elapsed);
	}

	override function beatHit(){
		super.beatHit();
		if (logo != null) logo.play('bump', true);
		if (!closedTitle){
			if (!bePressed){
				if (FlxG.camera.zoom < 1.35)
					FlxG.camera.zoom += 0.015;
				newIntro = FlxG.random.int(0, 1);
			}
			if (!skippedIntro){
				theBeats++;
				switch (theBeats){
					case 1:
						Music.play_('themeMenu', 0,  true, false);
						FlxG.sound.music.fadeIn(4, 0, 0.7);
					case 2: createText(['NGS Engine by'], 40);
					case 4:
						addText('NGS 300', 40);
						addText('Kiwi Sky', 40);
					case 5: deleteText();
					case 6: createText(['Not associated', 'with'], -40);
					case 8:
						addText('Newgrounds', -40);
						ngeSpr.visible = true;
					case 9:
						deleteText();
						ngeSpr.visible = false;
					case 10: createText([curWacky[0]]);
					case 12: addText(curWacky[1]);
					case 13: deleteText();
					case 14: addText('Friday');
					case 15: addText('Night');
					case 16: addText('Funkin');
					case 17: skipIntro();
				}
			}
		}
	}

	function getIntroText():Array<Array<String>>{
		var fullText:String = Assets.getText(Paths.txt('introText'));
		var theArray:Array<String> = fullText.split('\n');
		var swagArray:Array<Array<String>> = [];
		for (i in theArray)
			swagArray.push(i.split(' -- '));
		return swagArray;
	}

	function createText(textArray:Array<String>, ?offset:Float = 0){
		for (i in 0...textArray.length){
			var money:Alphabet = new Alphabet(0, 0, textArray[i], true);
			money.screenCenter(X);
			money.y += (i * 60) + 200 + offset;
			if (credGroup != null && textGroup != null){
				credGroup.add(money);
				textGroup.add(money);
			}
		}
	}

	function addText(text:String, ?offset:Float = 0){
		if (textGroup != null && credGroup != null){
			var coolText:Alphabet = new Alphabet(0, 0, text, true);
			coolText.screenCenter(X);
			coolText.y += (textGroup.length * 60) + 200 + offset;
			credGroup.add(coolText);
			textGroup.add(coolText);
		}
	}

	function deleteText(){
		while (textGroup.members.length > 0){
			credGroup.remove(textGroup.members[0], true);
			textGroup.remove(textGroup.members[0], true);
		}
	}

	function state(){
		/*var show = showNewUpdate;
		var save = ....;
		var state = (show ? 'warningUpdate' : !save ? 'menu' : 'warningEpilepsy');
		switchState(state);*/
		switchState('menu');
	}
}