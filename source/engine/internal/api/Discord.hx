package engine.internal.api;

import engine.internal.util.WindowUtil;
import lime.app.Application;
import Sys.sleep;
#if discord_rpc
  import discord_rpc.DiscordRpc;
#end

class Discord{
  public static var initialized = false;
  public static var api = { // Icon, Client ID, Name, Version
    icon: 'logo',
    id: Persist.discordAPI,
    name: 'NGS Engine v',
    version: 'Beta 0.1'
  };
  #if discord_rpc
    public function new(){
      #if debug
        Debug.log("Discord Client Starting...");
      #end
      
      DiscordRpc.start({
        clientID: api.id,
        onReady: onReady,
        onError: onError,
        onDisconnected: onDisconnected
      });

      #if debug
        Debug.log("Discord Client started.");
      #end

      while (true){
        DiscordRpc.process();
        sleep(2);
        /*#if debug
          Debug.log("Discord Client Update");
        #end*/
      }
      shutdown();
    }

    public static function shutdown(){
      DiscordRpc.shutdown();
      #if debug
        Debug.log("Discord Client Shutdown", 'notice');
      #end
    }

    static function onReady(){
      DiscordRpc.presence({
        details: "In Initialize",
        state: null,
        largeImageKey: api.icon,
        largeImageText: api.name + api.version
      });
    }

    public static function initialize(){
      if (!initialized){
        if (api.id != ''){
          var DiscordDaemon = sys.thread.Thread.create(() -> {
            new Discord();
          });
          initialized = true;

          #if debug
            Debug.log("Discord Client Initialized");
          #end

          WindowUtil.initWindowEvents();
          WindowUtil.windowExit.add(function(exitCode){
            shutdown();
          });
        }else{
          #if debug
            Debug.log("Discord Client Failed Initialize", 'error');
          #end
        }
      }else{
        #if debug
          Debug.log('Discord Client Running', 'notice');
        #end
      }
    }

    public static function presence(details:String, ?state:String, ?smallImageKey:String, ?hasStartTimestamp:Bool, ?endTimestamp:Float, ?largeImage:Null<String> = null){
      var startTimestamp:Float = if (hasStartTimestamp) Date.now().getTime() else 0;
      if (endTimestamp > 0)
        endTimestamp = startTimestamp + endTimestamp;

      DiscordRpc.presence({
        details: details,
        state: state,
        largeImageKey: (largeImage == null ? api.icon : largeImage),
        largeImageText: api.name + api.version,
        smallImageKey: smallImageKey,
        // Obtained times are in milliseconds so they are divided so Discord can use it
        startTimestamp: Std.int(startTimestamp / 1000),
        endTimestamp: Std.int(endTimestamp / 1000)
      });
      #if debug
        Debug.log('Discord RPC Updated. Arguments: $details, $state, $smallImageKey, $hasStartTimestamp, $endTimestamp');
      #end
    }

    static function onError(_code:Int, _message:String){
      Debug.log('Error! $_code : $_message', 'error');
    }
    static function onDisconnected(_code:Int, _message:String){
      Debug.log('Disconnected! $_code : $_message', 'notice');
    }
  #end
}