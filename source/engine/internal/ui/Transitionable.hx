package engine.internal.ui;

import engine.external.state.Title;
import haxe.ds.StringMap;
import flixel.FlxState;
import flixel.addons.transition.FlxTransitionableState;

class Transitionable extends FlxTransitionableState{

    public static function switchStateByName(stateName:String):Void{
        var stateMap:StringMap<Class<FlxState>> = new StringMap<Class<FlxState>>();
        stateMap.set("title", Title);
        //stateMap.set("menu", MainMenu);

        var nextStateClass = stateMap.get(stateName);
        var nextState:FlxState = null;
        if (nextStateClass != null){
            FlxG.switchState(Type.createInstance(nextStateClass, []));
            Debug.log('NextState: $nextStateClass');
        }else{
            Debug.log('State not found: $stateName');
            if (nextState == null)
                nextState = FlxG.state;
            if (nextState == FlxG.state){
                FlxG.resetState();
                return;
            }
        }
    }
}