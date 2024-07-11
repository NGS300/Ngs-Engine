package engine.internal.util;

import DateTools;

/**
 * Utilities for performing operations on dates.
*/
class DateUtil{
    /**
     * Returns the current date and time as a Date object.
    */
    public static function getCurrentDate():Date{
        return Date.now();
    }

    /**
     * Returns the current timestamp in seconds since epoch.
    */
    public static function getCurrentTimestamp():Float{
        return Sys.time();
    }

    /**
     * Returns the current date and time formatted as a string in "YYYY-MM-DD HH:MM:SS" format.
    */
    public static function getFormattedDate():String{
        var currentDate:Date = Date.now();
        return DateTools.format(currentDate, "%Y-%m-%d %H:%M:%S");
    }

    /**
     * Returns the current date formatted as a string in "YYYY-MM-DD" format.
    */
    public static function getFormattedDateOnly():String{
        var currentDate:Date = Date.now();
        return DateTools.format(currentDate, "%Y-%m-%d");
    }

    /**
     * Returns the current time formatted as a string in "HH:MM:SS.MS" format (including milliseconds).
    */
    public static function getFormattedTimeWithMilliseconds():String {
        var currentDate:Date = Date.now();
        var hours:String = StringTools.lpad(Std.string(currentDate.getHours()), "0", 2);
        var minutes:String = StringTools.lpad(Std.string(currentDate.getMinutes()), "0", 2);
        var seconds:String = StringTools.lpad(Std.string(currentDate.getSeconds()), "0", 2);
        var milliseconds:String = StringTools.lpad(Std.string(currentDate.getTime() % 1000), "000", 3);

        return hours + ":" + minutes + ":" + seconds + "." + milliseconds;
    }

    /**
     * Returns the current time formatted as a string in "HH:MM:SS" format.
    */
    public static function getFormattedTimeOnly():String{
        var currentDate:Date = Date.now();
        return DateTools.format(currentDate, "%H:%M:%S");
    }

    /**
     * Returns the current day of the week as a string (e.g., "Monday").
    */
    public static function getDayOfWeek():String{
        var currentDate:Date = Date.now();
        return DateTools.format(currentDate, "%A");
    }

    /**
     * Returns the name of the current month as a string (e.g., "July").
    */
    public static function getMonthName():String{
        var currentDate:Date = Date.now();
        return DateTools.format(currentDate, "%B");
    }

    /**
     * Returns a detailed string representation of the current date and time,
     * including year, month, day, hour, minutes, and seconds.
    */
    public static function getDetailedDate():String{
        var currentDate:Date = Date.now();
        return "Year: " + currentDate.getFullYear() +
               ", Month: " + (currentDate.getMonth() + 1) +
               ", Day: " + currentDate.getDate() +
               ", Hour: " + currentDate.getHours() +
               ", Minutes: " + currentDate.getMinutes() +
               ", Seconds: " + currentDate.getSeconds();
    }

    /**
     * Returns the current date and time formatted using a custom format "YYYY-MM-DD HH:MM:SS".
    */
    public static function getFormattedCustomDate(formatTxt = false):String{
        var i = Date.now();
        return formatDate(i, formatTxt);
    }
    /**
     * Private function to format a Date object into a string in "YYYY-MM-DD HH:MM:SS" format.
    */
     private static function formatDate(date:Date, isText = true):String{
        var year:String = Std.string(date.getFullYear());
        var month:String = StringTools.lpad(Std.string(date.getMonth() + 1), "0", 2);
        var day:String = StringTools.lpad(Std.string(date.getDate()), "0", 2);
        var hours:String = StringTools.lpad(Std.string(date.getHours()), "0", 2);
        var minutes:String = StringTools.lpad(Std.string(date.getMinutes()), "0", 2);
        var seconds:String = StringTools.lpad(Std.string(date.getSeconds()), "0", 2);
        
        if (isText)
            return year + "-" + month + "-" + day + "_" + hours + "-" + minutes + "-" + seconds;

        return year + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
    }

    public static function generateTimestamp(?date:Date = null):String{
      if (date == null) date = Date.now();
      return
        '${date.getFullYear()}-${Std.string(date.getMonth() + 1).lpad('0', 2)}-${Std.string(date.getDate()).lpad('0', 2)}-${Std.string(date.getHours()).lpad('0', 2)}-${Std.string(date.getMinutes()).lpad('0', 2)}-${Std.string(date.getSeconds()).lpad('0', 2)}';
    }
  
    public static function generateCleanTimestamp(?date:Date = null):String{
      if (date == null) date = Date.now();
      return '${DateTools.format(date, '%B %d, %Y')} at ${DateTools.format(date, '%I:%M %p')}';
    }
}