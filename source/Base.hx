package;

import engine.internal.debug.MemoryCounter;
import engine.internal.debug.FPSCounter;
import flixel.FlxGame;
import flixel.FlxState;
import haxe.ui.Toolkit;
import openfl.display.FPS;
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
        Toolkit.init();
        Toolkit.theme = 'dark'; // don't be cringe
        // Toolkit.theme = 'light'; // embrace cringe
        Toolkit.autoScale = false;
        // Don't focus on UI elements when they first appear.
        haxe.ui.focus.FocusManager.instance.autoFocus = false;
        haxe.ui.tooltips.ToolTipManager.defaultDelay = 200;
        memoryCounter = new MemoryCounter(10, 3, 0xFFFFFF);
        fpsCounter = new FPSCounter(10, 14, 0xFFFFFF);
        //Save.load();
        var game:FlxGame = new FlxGame(settings.width, settings.height, settings.initialState, settings.rate, settings.rate, settings.splash, settings.fullscreen);
        @:privateAccess
        //game._customSoundTray = funkin.ui.options.FunkinSoundTray;
        addChild(game);

        /*#if debug
        game.debugger.interaction.addTool(new funkin.util.TrackerToolButtonUtil());
        #end*/
        #if !html5
        addChild(memoryCounter);
        #end
        addChild(fpsCounter);

        #if hxcpp_debug_server
        trace('hxcpp_debug_server is enabled! You can now connect to the game with a debugger.');
        #else
        trace('hxcpp_debug_server is disabled! This build does not support debugging.');
        #end
    }
}