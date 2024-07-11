package engine.internal.save.raw;

import engine.internal.debug.Debug;
import sys.FileSystem;
import sys.io.File;
import haxe.Json;
import haxe.crypto.Base64;
import haxe.zip.Compress;
import haxe.zip.Uncompress;
import haxe.io.Bytes;

typedef DataVar = {
    var autoPause:Bool;
    var bool:Map<String, Bool>;
    var int:Map<String, Int>;
    var float:Map<String, Float>;
}

/**
 * [Game Data Save]
*/
class RawSave{
    public static var data:DataVar;
    static var test = {"sus": true};

    // Constructs the appropriate save path based on the operating system
    public static function getFilePath():String{
        var username:String = Sys.getEnv("USER") != null ? Sys.getEnv("USER") : Sys.getEnv("USERNAME");
        final company:String = FlxG.stage.application.meta.get('company');
        final file:String = 'gameData';//FlxG.stage.application.meta.get('file').toLowerCase();
        var name:String = Persist.NAME == null ? 'Engine' : Persist.NAME.replace("'", "");
        var localPath = company + "/" + name;
        var extension = ".jsgs"; // JsonScript Game Save
        var path:String;

        #if windows
            path = "C:\\Users\\" + username + "\\AppData\\Roaming\\" + localPath + "\\" + file + extension;
        #elseif mac
            path = "/Users/" + username + "/Library/Application Support/" + localPath + "/" + file + extension;
        #elseif linux
            path = "/home/" + username + "/.local/share/" + localPath + "/" + file + extension;
        #else
            throw "Unsupported OS!";
        #end

        Paths.fileSystem(path);
        return path;
    }

    public static function loadData():Void{
        try{
            var filePath = getFilePath();
            if (!FileSystem.exists(filePath)){
                Debug.log("Save file does not exist.");
                return;
            }

            var compressedData:Bytes = File.getBytes(filePath);
            var uncompressedData:Bytes = Uncompress.run(compressedData);
            var base64Data:String = uncompressedData.toString();
            var jsonData:String = Base64.decode(base64Data).toString();
            test = Json.parse(jsonData);
            Debug.log("Data loaded from " + filePath);
        }catch (error:Dynamic)
            Debug.log("Error loading data: " + error);
    }

    public static function saveData():Void{
        try{
            var filePath = getFilePath();
            var jsonData:String = Json.stringify(test);
            var base64Data:String = Base64.encode(Bytes.ofString(jsonData));
            var compressedData:Bytes = Compress.run(Bytes.ofString(base64Data), 9);
            File.saveBytes(filePath, compressedData);
            Debug.log("Data saved to " + filePath);
        }catch (error:Dynamic)
            Debug.log("Error saving data: " + error);
    }
}