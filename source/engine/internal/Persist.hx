package engine.internal;

import flixel.system.FlxBasePreloader;
import flixel.util.FlxColor;
import lime.app.Application;

/**
 * A store of unchanging, globally relevant values.
*/
class Persist{
    /**
     * ENGINE DATA INFO's
    */
    // ==============================

    /**
     * The title of the game, for debug printing purposes.
     * Change this if you're making an engine/mod.
    */
    public static final TITLE:String = "Friday Night Funkin' NGS Engine";


    /**
     * The current version number of the game.
     * Modify this in the `project.xml` file.
    */
    public static var VERSION(get, never):String;

    /**
     * The generatedBy string embedded in the chart files made by this application.
    */
    public static var GENERATED_BY(get, never):String;

    static function get_GENERATED_BY():String{
        return '${Persist.TITLE} - ${Persist.VERSION}';
    }

    /**
     * A suffix to add to the game version.
     * Add a suffix to prototype builds and remove it for releases.
    */
    public static final VERSION_SUFFIX:String = #if (DEBUG || FORCE_DEBUG_VERSION) ' PROTOTYPE' #else '' #end;

    #if (debug || FORCE_DEBUG_VERSION)
    static function get_VERSION():String{
        return 'v${Application.current.meta.get('version')} (${GIT_BRANCH} : ${GIT_HASH}${GIT_HAS_LOCAL_CHANGES ? ' : MODIFIED' : ''})' + VERSION_SUFFIX;
    }
    #else
    static function get_VERSION():String{
        return 'v${Application.current.meta.get('version')}' + VERSION_SUFFIX;
    }
    #end

    /**
     * REPOSITORY DATA
    */
    // ==============================

    /**
     * The current Git branch.
    */
    public static final GIT_BRANCH:String = engine.internal.util.macro.GitCommit.getGitBranch();

    /**
     * The current Git commit hash.
    */
    public static final GIT_HASH:String = engine.internal.util.macro.GitCommit.getGitCommitHash();
    public static final GIT_HAS_LOCAL_CHANGES:Bool = engine.internal.util.macro.GitCommit.getGitHasLocalChanges();

    /**
     * TIMING
    */
    // ==============================

    /**
     * A magic number used when calculating scroll speed and note distances.
    */
    public static final PIXELS_PER_MS:Float = 0.45;

    /**
     * The maximum interval within which a note can be hit, in milliseconds.
    */
    public static final HIT_WINDOW_MS:Float = 160.0;

    /**
     * Constant for the number of seconds in a minute.
     *
     * sex per min
    */
    public static final SECS_PER_MIN:Int = 60;

    /**
     * Constant for the number of milliseconds in a second.
    */
    public static final MS_PER_SEC:Int = 1000;

    /**
     * The number of microseconds in a millisecond.
    */
    public static final US_PER_MS:Int = 1000;

    /**
     * The number of microseconds in a second.
    */
    public static final US_PER_SEC:Int = US_PER_MS * MS_PER_SEC;

    /**
     * The number of nanoseconds in a microsecond.
    */
    public static final NS_PER_US:Int = 1000;

    /**
     * The number of nanoseconds in a millisecond.
    */
    public static final NS_PER_MS:Int = NS_PER_US * US_PER_MS;

    /**
     * The number of nanoseconds in a second.
    */
    public static final NS_PER_SEC:Int = NS_PER_US * US_PER_MS * MS_PER_SEC;

    /**
     * Duration, in milliseconds, until toast notifications are automatically hidden.
    */
    public static final NOTIFICATION_DISMISS_TIME:Int = 5 * MS_PER_SEC;

    /**
     * Duration to wait before autosaving the chart.
    */
    public static final AUTOSAVE_TIMER_DELAY_SEC:Float = 5.0 * SECS_PER_MIN;

    /**
     * Number of steps in a beat.
     * One step is one 16th note and one beat is one quarter note.
    */
    public static final STEPS_PER_BEAT:Int = 4;

    /**
     * All MP3 decoders introduce a playback delay of `528` samples,
     * which at 44,100 Hz (samples per second) is ~12 ms.
    */
    public static final MP3_DELAY_MS:Float = 528 / 44100 * Persist.MS_PER_SEC;

    /**
     * Each step of the preloader has to be on screen at least this long.
     *
     * 0 = The preloader immediately moves to the next step when it's ready.
     * 1 = The preloader waits for 1 second before moving to the next step.
     *     The progress bare is automatically rescaled to match.
    */
    #if debug
        public static final PRELOADER_MIN_STAGE_TIME:Float = 0.0;
    #else
        public static final PRELOADER_MIN_STAGE_TIME:Float = 0.1;
    #end

    /**
     * FILE EXTENSIONS
    */
    // ==============================

    /**
     * The file extension used when exporting chart files.
     *
     * - "I made a new file format"
     * - "Actually new or just a renamed ZIP?"
    */
    public static final EXT_CHART = "ec";

    /**
     * The file extension used when loading audio files.
    */
    public static final EXT_SOUND = #if web "mp3" #else "ogg" #end;

    /**
     * The file extension used when loading video files.
    */
    public static final EXT_VIDEO = "mp4";

    /**
     * The file extension used when loading image files.
    */
    public static final EXT_IMAGE = "png";

    /**
     * The file extension used when loading data files.
    */
    public static final EXT_DATA = "json";
}