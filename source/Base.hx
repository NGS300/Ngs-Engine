package;

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
    public var settings ={
        initialState: Test,
        fullscreen: false,
        splash: true,
        width: 1366, // 1280
        height: 768, // 720
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
        initHaxeUI();
        fpsCounter = new FPSCounter(10, 14, 0xFFFFFF);
        memoryCounter = new MemoryCounter(10, 2, 0xFFFFFF);
        //Save.load();
        var game:FlxGame = new FlxGame(settings.width, settings.height, settings.initialState, settings.rate, settings.rate, settings.splash, settings.fullscreen);
        @:privateAccess
        game._customSoundTray = engine.internal.ui.SoundTray;
        addChild(game);

        #if debug
            game.debugger.interaction.addTool(new engine.internal.util.TrackerToolButtonUtil());
        #end
        addChild(fpsCounter);
        #if !html5
            addChild(memoryCounter);
        #end

        #if hxcpp_debug_server
            trace('hxcpp_debug_server is enabled! You can now connect to the game with a debugger.');
        #else
            trace('hxcpp_debug_server is disabled! This build does not support debugging.');
        #end
		Client.initialize();
        Gamejolt.initialize();
    }
    function initHaxeUI():Void{
        // Calling this before any HaxeUI components get used is important:
        // - It initializes the theme styles.
        // - It scans the class path and registers any HaxeUI components.
        Toolkit.init();
        Toolkit.theme = 'dark'; // don't be cringe
        Toolkit.autoScale = false;
        haxe.ui.focus.FocusManager.instance.autoFocus = false; // Don't focus on UI elements when they first appear.
        haxe.ui.tooltips.ToolTipManager.defaultDelay = 200;
    }
}