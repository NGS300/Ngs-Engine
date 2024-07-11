package engine.internal.debug;

import engine.internal.util.WindowUtil;
import engine.internal.util.DateUtil;
import sys.io.File;

class Debug{
    static var output:sys.io.FileOutput = null; // Output file handler for logging
    static var logFile:Null<String> = null; // Path to the log file

    /**
     * Initializes the debug logging system.
    */
    public static function initialize():Void{
        // Register a callback to handle application exit
        WindowUtil.initWindowEvents();
        WindowUtil.windowExit.add(function(exitCode){
            var name:String = "Log closed.";
            if (output != null){
                log(name);
                output.close(); // Close the log file if it's open
            }else
                defaultLog('error', name, false); // Trace to console if log file is not open
        });

        // Generate a timestamp string for the log file name
        var timestamp:String = DateUtil.getFormattedCustomDate(true); // Include milliseconds in the timestamp
        logFile = "engine/log/log_" + timestamp + ".txt"; // Construct the path to the log file
        try{
            output = File.write(logFile, true); // Attempt to open the log file for writing
            if (output != null)
                log("Log initialized."); // Log initialization message
            else
                defaultLog('error', "Failed to open log file.", false); // Trace to console if opening the log file failed
        }catch (e:Dynamic)
            defaultLog('error', "Error opening log file: " + e, false); // Trace any errors encountered while opening the log file
    }

    /**
     * Logs a message to the debug output.
     * @param message The message to log.
    */
    public static function log(message:String, method = 'add'):Void{
        var i = timeStamp(message); // Store the formatted message
        tracer(i, false); // Trace the formatted message to the console (DON'T REMOVE THIS!)
        defaultLog(method, i, false); // Call the default logging method with the message
        outputer(i);
    }

    /**
     * Calls the default logging method with specified method and message.
     * @param method The method name to call.
     * @param message The message to log.
    */
    public static function defaultLog(method:String, message:String, canLog = true):Void{
        Reflect.callMethod(FlxG.log, Reflect.field(FlxG.log, method), [message]); // Call the specified logging method
        if (canLog){
            var i = timeStamp(message);
            outputer(i);
        }
    }

    /**
     * Traces a message to the console.
     * @param message The message to trace.
    */
    public static function tracer(message:Dynamic, canLog = true):Void{
        haxe.Log.trace(message); // Trace the message to the console
        if (canLog){
            var i = timeStamp(message);
            outputer(i);
        }
    }

    static function timeStamp(message:String){
        var timestamp:String = DateUtil.getFormattedTimeWithMilliseconds(); // Get current time with milliseconds
        var logMessage:String = "[" + timestamp + "] " + message; // Format the log message
        return logMessage;
    }
    static function outputer(message:String){
        output.writeString(message + "\n"); // Write the message to the log file
        output.flush(); // Flush the output to ensure it's written immediately
    }
}