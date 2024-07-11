package engine.internal.util;

import openfl.Assets;

class CoolUitl{
    inline public static function numberArray(max:Int, ?min = 0):Array<Int>{
		var thisArray:Array<Int> = [];
		for (i in min...max)
            thisArray.push(i);

		return thisArray;
	}

    inline public static function coolTextFile(path:String):Array<String>{
		var daList:String = null;
		if (Assets.exists(path))
            daList = Assets.getText(path);

		return daList != null ? listFromString(daList) : [];
	}

	public static function floorDecimal(value:Float, decimals:Int):Float{
		if (decimals < 1)
			return Math.floor(value);

		var tempMult:Float = 1;
		for (i in 0...decimals)
			tempMult *= 10;

		var newValue:Float = Math.floor(value * tempMult);
		return newValue / tempMult;
	}

	inline public static function listFromString(string:String):Array<String>{
		var daList:Array<String> = [];
		daList = string.trim().split('\n');
		for (i in 0...daList.length)
			daList[i] = daList[i].trim();

		return daList;
	}

    inline public static function quantize(f:Float, snap:Float){
		var m:Float = Math.fround(f * snap);
		return (m / snap);
	}

    inline public static function capitalize(text:String){
		return text.charAt(0).toUpperCase() + text.substr(1).toLowerCase();
	}
}