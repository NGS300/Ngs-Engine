package engine.internal.api;
import lime.app.Application;
import Sys.sleep;
#if discord_rpc
  import discord_rpc.DiscordRpc;
#end

class Client{
  public static var initialized:Bool = false;
  public static var api ={ // Icon, Client ID, Name, Version
    icon: 'logo',
    id: Persist.discordAPI,
    name: 'NGS Engine v',
    version: 'Beta 0.1'
  };
  #if discord_rpc
    public function new(){
      #if debug
        trace("Discord Client Starting...");
      #end
      DiscordRpc.start({
        clientID: api.id,
        onReady: onReady,
        onError: onError,
        onDisconnected: onDisconnected
      });
      #if debug
        trace("Discord Client started.");
      #end

      while (true){
        DiscordRpc.process();
        sleep(2);
        /*#if debug
          trace("Discord Client Update");
        #end*/
      }
      shutdown();
    }

    public static function shutdown(){
      DiscordRpc.shutdown();
      #if debug
        trace("Discord Client Shutdown");
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
          var DiscordDaemon = sys.thread.Thread.create(() ->{
            new Client();
          });
          #if debug
            trace("Discord Client Initialized");
          #end
          initialized = true;
          Application.current.onExit.add(function(exitCode){
            shutdown();
          });
        }else{
          #if debug
            trace("Discord Client Failed Initialize");
          #end
        }
      }else{
        #if debug
          trace('Discord Client Running');
        #end
      }
    }

    public static function presence(details:String, ?state:String, ?smallImageKey:String, ?hasStartTimestamp:Bool, ?endTimestamp:Float, ?largeImage:Null<String> = null){
      var startTimestamp:Float = if (hasStartTimestamp) Date.now().getTime() else 0;
      if (endTimestamp > 0) endTimestamp = startTimestamp + endTimestamp;
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
        trace('Discord RPC Updated. Arguments: $details, $state, $smallImageKey, $hasStartTimestamp, $endTimestamp');
      #end
    }

    static function onError(_code:Int, _message:String){trace('Error! $_code : $_message');}
    static function onDisconnected(_code:Int, _message:String){trace('Disconnected! $_code : $_message');}
  #end
}