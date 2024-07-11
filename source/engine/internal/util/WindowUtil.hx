package engine.internal.util;

import openfl.Lib;
import lime.app.Application;
import flixel.util.FlxSignal.FlxTypedSignal;
using StringTools;

/**
 * Utilities for operating on the current window, such as changing the title.
*/
#if (cpp && windows)
  @:cppFileCode('
  #include <iostream>
  #include <windows.h>
  #include <psapi.h>
  ')
#end
class WindowUtil{
  /**
   * Runs platform-specific code to open a URL in a web browser.
   * @param targetUrl The URL to open.
  */
  public static function openURL(targetUrl:String):Void{
    #if CAN_OPEN_LINKS
      #if linux
        Sys.command('/usr/bin/xdg-open', [targetUrl, '&']);
      #else
        FlxG.openURL(targetUrl); // This should work on Windows and HTML5.
      #end
      Debug.log('Url: ' + targetUrl);
    #else
      var name = 'Cannot open URLs on this platform.'; 
      throw name;
      Debug.log(name, 'warn');
    #end
  }

  /**
   * Runs platform-specific code to open a path in the file explorer.
   * @param targetPath The path to open.
  */
  public static function openFolder(targetPath:String):Void{
    #if CAN_OPEN_LINKS
      #if windows
        Sys.command('explorer', [targetPath.replace('/', '\\')]);
      #elseif mac
        Sys.command('open', [targetPath]);
      #elseif linux
        Sys.command('open', [targetPath]);
      #end
      Debug.log('Folder: ' + targetPath);
    #else
      var name = 'Cannot open URLs on this platform.'; 
      throw name;
      Debug.log(name, 'warn');
    #end
  }
    /*inline public static function folder(folder:String, absolute = false){
      #if sys
        if (!absolute)
                  folder =  Sys.getCwd() + '$folder';
  
        folder = folder.replace('/', '\\');
        if (folder.endsWith('/'))
                  folder.substr(0, folder.length - 1);
  
        #if linux
            var command:String = '/usr/bin/xdg-open';
        #else
            var command:String = 'explorer.exe';
        #end
        Sys.command(command, [folder]);
        Debug.log('$command $folder');
      #else
        Debug.log("Platform is not supported for CoolUtil.folder", 'error');
      #end
    }*/

  /**
   * Runs platform-specific code to open a file explorer and select a specific file.
   * @param targetPath The path of the file to select.
  */
  public static function openSelectFile(targetPath:String):Void{
    #if CAN_OPEN_LINKS
      #if windows
        Sys.command('explorer', ['/select,' + targetPath.replace('/', '\\')]);
      #elseif mac
        Sys.command('open', ['-R', targetPath]);
      #elseif linux
        // TODO: unsure of the linux equivalent to opening a folder and then "selecting" a file.
        Sys.command('open', [targetPath]);
      #end
      Debug.log('Select: ' + targetPath);
    #else
      var name = 'Cannot open URLs on this platform.'; 
      throw name;
      Debug.log(name, 'warn');
    #end
  }

  /**
   * Dispatched when the game window is closed.
  */
  public static final windowExit:FlxTypedSignal<Int->Void> = new FlxTypedSignal<Int->Void>();

  /**
   * Wires up FlxSignals that happen based on window activity.
   * For example, we can run a callback when the window is closed.
  */
  public static function initWindowEvents():Void{
    // onUpdate is called every frame just before rendering.
    // onExit is called when the game window is closed.
    Lib.current.stage.application.onExit.add(function(exitCode:Int){
      windowExit.dispatch(exitCode);
    });

    /*openfl.Lib.current.stage.addEventListener(openfl.events.KeyboardEvent.KEY_DOWN, (e:openfl.events.KeyboardEvent) ->{
      for (key in PlayerSettings.player1.controls.getKeysForAction(FULLSCREEN)){
        if (e.keyCode == key)
          openfl.Lib.application.window.fullscreen = !openfl.Lib.application.window.fullscreen;
      }
    });*/
  }

  /**
   * Turns off that annoying "Report to Microsoft" dialog that pops up when the game crashes.
  */
  public static function disableCrashHandler():Void{
    #if (cpp && windows)
      untyped __cpp__('SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOGPFAULTERRORBOX);');
    #else
      // Do nothing.
    #end
  }

  /**
   * Sets the title of the application window.
   * @param value The title to use.
  */
  public static function setWindowTitle(?name:String, deffault = false):String{
    var engi = Persist.engineInfo;
    var result:String = '';
    var tit = Application.current.window.title;
    if (deffault) // default TRUE
      result = tit = engi.title;
    else
      result = tit = engi.title = name;

    return result;
  }

  public static function windowMove(xy:Array<Null<Int>>){
    var result = [xy[0], (xy[1] > 0 ? - xy[1] : - xy[1])];
    var ignore:Array<Bool> = [false, false];
    if (xy[0] == null)
      ignore[0] = true;
    else if (xy[1] == null)
      ignore[1] = true;

    var win = Application.current.window;
    if (!ignore[0])
      win.x += result[0];

    if (!ignore[1])
      win.y += result[1];
  }

  public static function windowPos(xy:Array<Null<Int>>){
    var result = xy;
    var ignore:Array<Bool> = [false, false];
    if (xy[0] == null)
      ignore[0] = true;
    else if (xy[1] == null)
      ignore[1] = true;

    var win = Application.current.window;
    if (!ignore[0])
      win.x = result[0];
    if (!ignore[1])
      win.y = result[1];
  }

  /**
   * [App Get]
   * @param get Meta Name
  */
  public static function getWindowMeta(get:String):Null<String>{
    var push = Application.current.meta.get;
    var result:String = '';
    switch (get){
      case 'v' | 'version': result = push('version');
      case 't' | 'title': result = push('title');
    }
    return result;
  }
}