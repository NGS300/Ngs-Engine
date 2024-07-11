package engine.internal.song;

import engine.internal.song.SectionFomat;

typedef Meta = { // METADATA
    var name:Map<String, String>; // Song Info's
}

typedef Song = { // SONGDATA
    var version:String; // Song Version
    var type:Map<String, Float>; // Song TypeData
    var ost:Map<String, Dynamic>; // Song OST's
}

typedef Data = { // DATAPUSH
    var noteStyle:String;
    var stage:String;
}

typedef Note = { // NOTES
    var offset:Float; // Offset Note
    var notes:Array<Event>; // Section Notes
    var sections:Array<Section>; // Events Sections
}

class SongFormat{
    public static function setMeta(meta:Meta){
        var id = Persist.songData;
        var string = StringTools.replace(id.name, "-", " ").toLowerCase();
        meta.name = [
            "name" => id.name,
            "song" => id.name.toLowerCase(),
            "id" => string,
            "artist" => id.artist
        ];
    }

    public static function setSong(song:Song){
        var id = Persist.songData;
        song.version = id.version;
        song.type = [
            "bpm" => id.bpm,
            "speed" => id.speed
        ];
        ostPatch([id, song]);
    }
    static function ostPatch(song:Array<Dynamic>){ // That's THEORETICAL, nothing Exoerimental
        var id = song[0];
        song[1].ost = [
            "vocals" => [
                "directory" => ['songs/vocals'],
                "player" => ['bf', 'gfBombox'],
                "opponent" => ['gfBombox', 'bf'],
                "default?" => [''],
            ],

            "instrumentals" => [
                "directory" => ['songs/instrumentals'],
                "patch" => ['tutorial.zip'],
                "alt?" => ['erect', 'remade'],
            ],
        ];

        song[1].volumes = [
            "volumes" => [
                "player" => 1.0,
                "opponent" => 1.0,
                "instrumental" => 1.0,
            ],
        ];
    }

    public static function setData(data:Data){
        var id = Persist.songData;
        data.noteStyle = 'defaultNotes';
        data.stage = 'mainStage';
    }

    public static function setNotes(note:Note){
        var id = Persist.songData;
        note.offset = 0;
    }
}