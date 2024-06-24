package engine.internal.graphics;

import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

class TypedGroup<T:FlxBasic> extends FlxTypedGroup<FlxSprite>{
    public function new(){
        super();
    }
}