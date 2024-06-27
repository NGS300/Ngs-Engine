package engine.internal;

import lime.app.Application;
import flixel.system.FlxBasePreloader;
import flixel.util.FlxColor;

/**
 * A store of unchanging, globally relevant values.
*/
class Persist{    
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
     * API DATA
    */
    // ==============================
    public static var discordAPI:String = '966024519271710780';
    public static var gamejoltAPI ={
        id: '702509',
        key: '1c9d49cd39dd3321a3d49ad1a23240ee'
    };

    /**
     * ENGINE DATA INFO's
    */
    // ==============================

    /**
     * Engine Name
    */
    public static var SUFFIX:String = #if (DEBUG || FORCE_DEBUG_VERSION) 'BETA' #else '' #end;
    public static var NAME:String = "NG's Engine";
    public static var ENGINE ={
        name: NAME,
        title: "Friday Night Funkin': " + NAME,
        version: '1.0.0 ' + SUFFIX
    }


    /**
     * FILE EXTENSIONS
    */
    // ==============================

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

    /**
     * SONG DATA
    */
    // ==============================

    /**
     * Song Global SetUP
    */
    public static var song ={
        engine: ENGINE.name,
        version: ENGINE.version,
        name: 'Unknown',
        artist: 'Unknown',
        stage: '',
        characters: ['player' => '', 'speaker' => '', 'opponent' => ''],
        vocalsVol: ['vocals' => 1.0, 'player' => 1.0, 'speaker' => 1.0, 'opponent' => 1.0],
        vocals: ['vocals' => 'vocals', 'player' => 'player', 'speaker' => 'speaker', 'opponent' => 'opponent'],
        instVol: ['inst' => 1.0],
        inst: ['inst' => 'inst'],
        altInst: [],
    }
}