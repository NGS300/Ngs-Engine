package engine.internal.song;

typedef Property = {
    var engine:Map<String, String>; // Engine Info's
}

class Format{
    public static function setProperty(property:Property){
        var id = Persist.engineInfo;
        property.engine = [
            "name" => id.name,
            "version" => id.version,
            "state" => id.state,
            "update" => 'Update: ' + id.num
        ];
    }
}