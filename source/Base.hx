package;

import engine.internal.debug.Debug;
import engine.internal.save.Save;
import openfl.display.StageScaleMode;
import engine.external.state.Title;
import engine.internal.util.WindowUtil;
import engine.internal.api.Gamejolt;
import engine.internal.api.Discord;
import engine.internal.debug.MemoryCounter;
import engine.internal.debug.FPSCounter;
import flixel.FlxGame;
import haxe.ui.Toolkit;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.media.Video;
import openfl.net.NetStream;

/**
 * The Base class which initializes HaxeFlixel and starts the game in its initial state.
*/
class Base extends Sprite{
    public var settings = {
        initialState: Title,
        fullscreen: false,
        splash: true,
        width: 1280,
        height: 720,
        zoom: -1.0,
        #if web
            rate: 60
        #else
            rate: 144
        #end
    };

    public static function base():Void{
        Lib.current.addChild(new Base());
    }

    public function new(){
        super();
        Debug.initialize();
        WindowUtil.setWindowTitle(true);
        if (stage != null)
            init();
        else
            addEventListener(Event.ADDED_TO_STAGE, init);
    }

    function init(?event:Event):Void{
        if (hasEventListener(Event.ADDED_TO_STAGE))
            removeEventListener(Event.ADDED_TO_STAGE, init);
        setup();
    }

    var video:Video;
    var netStream:NetStream;
    var overlay:Sprite;
    public static var fpsCounter:FPSCounter;
    public static var memoryCounter:MemoryCounter;
    function setup():Void{
        //! Haxe_UI
        Toolkit.init();
        Toolkit.theme = 'dark';
        Toolkit.autoScale = false;
        haxe.ui.focus.FocusManager.instance.autoFocus = false; // Don't focus on UI elements when they first appear.
        haxe.ui.tooltips.ToolTipManager.defaultDelay = 200;
        
        //! Calc_Stage
        var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
        var i = settings;
		if (i.zoom == -1.0){
			var ratioX:Float = stageWidth / i.width;
			var ratioY:Float = stageHeight / i.height;
			i.zoom = Math.min(ratioX, ratioY);
			i.width = Math.ceil(stageWidth / i.zoom);
			i.height = Math.ceil(stageHeight / i.zoom);
		}

        //! Base
        SaveData.init();
        var game = new FlxGame(settings.width, settings.height, settings.initialState, settings.rate, settings.rate, settings.splash, settings.fullscreen);
        @:privateAccess
        game._customSoundTray = engine.internal.ui.SoundTray;
        addChild(game);

        #if debug
            game.debugger.interaction.addTool(new engine.internal.util.TrackerToolButtonUtil());
        #end

        fpsCounter = new FPSCounter(10, 14, 0xFFFFFF);
        memoryCounter = new MemoryCounter(10, 2, 0xFFFFFF);
        addChild(fpsCounter);
        #if !html5
            addChild(memoryCounter);
        #else
            FlxG.autoPause = false;
            FlxG.mouse.visible = false;
        #end

        /*#if linux
            var icon = Image.fromFile("icon.png");
            Lib.current.stage.window.setIcon(icon);
		#end*/


        Lib.current.stage.align = "tl";
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;

        #if hxcpp_debug_server
            Debug.log('hxcpp_debug_server is enabled! You can now connect to the game with a debugger.');
        #else
            Debug.log('hxcpp_debug_server is disabled! This build does not support debugging.');
        #end
        Gamejolt.initialize();
		Discord.initialize();
    }
}