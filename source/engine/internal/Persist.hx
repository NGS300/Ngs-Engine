package engine.internal;

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
    public static var discordAPI = '966024519271710780';
    public static var gamejoltAPI = {
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
    public static var NAME = "NG's Engine";
    public static var engineInfo = {
        version: '1.0.0',
        name: NAME,
        title: "Friday Night Funkin': " + NAME,
        state: 'Beta',
        num: 0
    }

    public static var engineOptions = {
        downscroll: false
    }


    /**
     * SONG DATA
    */
    // ==============================

    /**
     * Song Global SetUP
    */
    public static var songData = { // Song Global Setup
        // Song Property
        version: '1.0.0',
        name: 'Unknown',
        artist: 'Unknown',
        bpm: 100.0,
        speed: 1.0,

        // Map
        stage: 'mainStage',

        // Characters
        player: '',
        opponent: '',
        speaker: ''
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
}