package engine.internal.util;
import flixel.util.FlxColor;
import haxe.ui.util.Color;
abstract ColorsUtil(Int) from Int{
    public static var colorMap:Map<String, Int> = [
        "black" =>   0xFF000000,
        "white" =>   0xFFFFFFFF,
        "mediumvioletred" => 0xFFc71585,
        "deeppink" =>  0xFFff1493,
        "palevioletred" =>  0xFFdb7093,
        "hotpink" => 0xFFff69b4,
        "lightpink" => 0xFFffb6c1,
        "pink" =>    0xFFffc0cb,
        "darkred" => 0xFF8b0000,
        "red" =>     0xFFff0000,
        "firebrick" => 0xFFb22222,
        "crimson" => 0xFFdc143c,
        "indianred" => 0xFFcd5c5c,
        "lightcoral" =>  0xFFf08080,
        "salmon" =>  0xFFfa8072,
        "darksalmon" =>  0xFFe9967a,
        "lightsalmon" => 0xFFffa07a,
        "orangered" => 0xFFff4500,
        "tomato" =>  0xFFff6347,
        "darkorange" =>  0xFFff8c00,
        "coral" =>   0xFFff7f50,
        "orange" =>  0xFFffa500,
        "darkkhaki" => 0xFFbdb76b,
        "gold" =>    0xFFffd700,
        "khaki" =>   0xFFf0e68c,
        "peachpuff" => 0xFFffdab9,
        "yellow" =>  0xFFffff00,
        "palegoldenrod" =>  0xFFeee8aa,
        "moccasin" =>  0xFFffe4b5,
        "papayawhip" =>  0xFFffefd5,
        "lightgoldenrodyellow" =>   0xFFfafad2,
        "lemonchiffon" =>   0xFFfffacd,
        "lightyellow" => 0xFFffffe0,
        "maroon" =>  0xFF800000,
        "brown" =>   0xFFa52a2a,
        "saddlebrown" => 0xFF8b4513,
        "sienna" =>  0xFFa0522d,
        "chocolate" => 0xFFd2691e,
        "darkgoldenrod" =>  0xFFb8860b,
        "peru" =>    0xFFcd853f,
        "rosybrown" => 0xFFbc8f8f,
        "goldenrod" => 0xFFdaa520,
        "sandybrown" =>  0xFFf4a460,
        "tan" =>     0xFFd2b48c,
        "burlywood" => 0xFFdeb887,
        "wheat" =>   0xFFf5deb3,
        "navajowhite" => 0xFFffdead,
        "bisque" =>  0xFFffe4c4,
        "blanchedalmond" => 0xFFffebcd,
        "cornsilk" =>  0xFFfff8dc,
        "darkgreen" => 0xFF006400,
        "green" =>   0xFF008000,
        "darkolivegreen" => 0xFF556b2f,
        "forestgreen" => 0xFF228b22,
        "seagreen" =>  0xFF2e8b57,
        "olive" =>   0xFF808000,
        "olivedrab" => 0xFF6b8e23,
        "mediumseagreen" => 0xFF3cb371,
        "limegreen" => 0xFF32cd32,
        "lime" =>    0xFF00ff00,
        "springgreen" => 0xFF00ff7f,
        "mediumspringgreen" =>      0xFF00fa9a,
        "darkseagreen" =>   0xFF8fbc8f,
        "mediumaquamarine" =>       0xFF66cdaa,
        "yellowgreen" => 0xFF9acd32,
        "lawngreen" => 0xFF7cfc00,
        "chartreuse" =>  0xFF7fff00,
        "lightgreen" =>  0xFF90ee90,
        "greenyellow" => 0xFFadff2f,
        "palegreen" => 0xFF98fb98,
        "teal" =>    0xFF008080,
        "darkcyan" =>  0xFF008b8b,
        "lightseagreen" =>  0xFF20b2aa,
        "cadetblue" => 0xFF5f9ea0,
        "darkturquoise" =>  0xFF00ced1,
        "mediumturquoise" => 0xFF48d1cc,
        "turquoise" => 0xFF40e0d0,
        "aqua" =>    0xFF00ffff,
        "cyan" =>    0xFF00ffff,
        "aquamarine" =>  0xFF7fffd4,
        "paleturquoise" =>  0xFFafeeee,
        "lightcyan" => 0xFFe0ffff,
        "navy" =>    0xFF000080,
        "darkblue" =>  0xFF00008b,
        "mediumblue" =>  0xFF0000cd,
        "blue" =>    0xFF0000ff,
        "midnightblue" =>   0xFF191970,
        "royalblue" => 0xFF4169e1,
        "steelblue" => 0xFF4682b4,
        "dodgerblue" =>  0xFF1e90ff,
        "deepskyblue" => 0xFF00bfff,
        "cornflowerblue" => 0xFF6495ed,
        "skyblue" => 0xFF87ceeb,
        "lightskyblue" =>   0xFF87cefa,
        "lightsteelblue" => 0xFFb0c4de,
        "lightblue" => 0xFFadd8e6,
        "powderblue" =>  0xFFb0e0e6,
        "indigo" =>  0xFF4b0082,
        "purple" =>  0xFF800080,
        "darkmagenta" => 0xFF8b008b,
        "darkviolet" =>  0xFF9400d3,
        "darkslateblue" =>  0xFF483d8b,
        "blueviolet" =>  0xFF8a2be2,
        "darkorchid" =>  0xFF9932cc,
        "fuchsia" => 0xFFff00ff,
        "magenta" => 0xFFff00ff,
        "slateblue" => 0xFF6a5acd,
        "mediumslateblue" => 0xFF7b68ee,
        "mediumorchid" =>   0xFFba55d3,
        "mediumpurple" =>   0xFF9370db,
        "orchid" =>  0xFFda70d6,
        "violet" =>  0xFFee82ee,
        "plum" =>    0xFFdda0dd,
        "thistle" => 0xFFd8bfd8,
        "lavender" =>  0xFFe6e6fa,
        "mistyrose" => 0xFFffe4e1,
        "antiquewhite" =>   0xFFfaebd7,
        "linen" =>   0xFFfaf0e6,
        "beige" =>   0xFFf5f5dc,
        "whitesmoke" =>  0xFFf5f5f5,
        "lavenderblush" =>  0xFFfff0f5,
        "oldlace" => 0xFFfdf5e6,
        "aliceblue" => 0xFFf0f8ff,
        "seashell" =>  0xFFfff5ee,
        "ghostwhite" =>  0xFFf8f8ff,
        "honeydew" =>  0xFFf0fff0,
        "floralwhite" => 0xFFfffaf0,
        "azure" =>   0xFFf0ffff,
        "mintcream" => 0xFFf5fffa,
        "snow" =>    0xFFfffafa,
        "ivory" =>   0xFFfffff0,
        "darkslategray" =>  0xFF2f4f4f,
        "dimgray" => 0xFF696969,
        "slategray" => 0xFF708090,
        "gray" =>    0xFF808080,
        "grey" =>    0xFF808080,
        "lightslategray" => 0xFF778899,
        "darkgray" =>  0xFFa9a9a9,
        "silver" =>  0xFFc0c0c0,
        "lightgray" => 0xFFd3d3d3,
        "gainsboro" => 0xFFdcdcdc,
        "slate-50" =>  0xFFF8FAFC,
        "slate-100" => 0xFFF1F5F9,
        "slate-200" => 0xFFE2E8F0,
        "slate-300" => 0xFFCBD5E1,
        "slate-400" => 0xFF94A3B8,
        "slate-500" => 0xFF64748B,
        "slate-600" => 0xFF475569,
        "slate-700" => 0xFF334155,
        "slate-800" => 0xFF1E293B,
        "slate-900" => 0xFF0F172A,
        "gray-50" => 0xFFF9FAFB,
        "gray-100" =>  0xFFF3F4F6,
        "gray-200" =>  0xFFE5E7EB,
        "gray-300" =>  0xFFD1D5DB,
        "gray-400" =>  0xFF9CA3AF,
        "gray-500" =>  0xFF6B7280,
        "gray-600" =>  0xFF4B5563,
        "gray-700" =>  0xFF374151,
        "gray-800" =>  0xFF1F2937,
        "gray-900" =>  0xFF111827,
        "zinc-50" => 0xFFFAFAFA,
        "zinc-100" =>  0xFFF4F4F5,
        "zinc-200" =>  0xFFE4E4E7,
        "zinc-300" =>  0xFFD4D4D8,
        "zinc-400" =>  0xFFA1A1AA,
        "zinc-500" =>  0xFF71717A,
        "zinc-600" =>  0xFF52525B,
        "zinc-700" =>  0xFF3F3F46,
        "zinc-800" =>  0xFF27272A,
        "zinc-900" =>  0xFF18181B,
        "neutral-50" =>  0xFFFAFAFA,
        "neutral-100" => 0xFFF5F5F5,
        "neutral-200" => 0xFFE5E5E5,
        "neutral-300" => 0xFFD4D4D4,
        "neutral-400" => 0xFFA3A3A3,
        "neutral-500" => 0xFF737373,
        "neutral-600" => 0xFF525252,
        "neutral-700" => 0xFF404040,
        "neutral-800" => 0xFF262626,
        "neutral-900" => 0xFF171717,
        "stone-50" =>  0xFFFAFAF9,
        "stone-100" => 0xFFF5F5F4,
        "stone-200" => 0xFFE7E5E4,
        "stone-300" => 0xFFD6D3D1,
        "stone-400" => 0xFFA8A29E,
        "stone-500" => 0xFF78716C,
        "stone-600" => 0xFF57534E,
        "stone-700" => 0xFF44403C,
        "stone-800" => 0xFF272524,
        "stone-900" => 0xFF1C1917,
        "red-50" =>  0xFFFEE2E2,
        "red-100" => 0xFFB91C1C,
        "red-200" => 0xFFEF4444,
        "red-300" => 0xFFFECACA,
        "red-400" => 0xFFF87171,
        "red-500" => 0xFFDC2626,
        "red-600" => 0xFFB91C1C,
        "red-700" => 0xFF991B1B,
        "red-800" => 0xFF7F1D1D,
        "red-900" => 0xFFB91C1C,
        "orange-50" => 0xFFFFF7ED,
        "orange-100" => 0xFFFFEDD5,
        "orange-200" => 0xFFFED7AA,
        "orange-300" => 0xFFFBBF24,
        "orange-400" => 0xFFF59E0B,
        "orange-500" => 0xFFEC9131,
        "orange-600" => 0xFFEA580C,
        "orange-700" => 0xFFCA8A04,
        "orange-800" => 0xFF9A3412,
        "orange-900" => 0xFF7C2D12,
        "amber-50" => 0xFFFFFBEA,
        "amber-100" => 0xFFFEF3C7,
        "amber-200" => 0xFFFDE68A,
        "amber-300" => 0xFFFCD34D,
        "amber-400" => 0xFFFBBF24,
        "amber-500" => 0xFFF59E0B,
        "amber-600" => 0xFFD97706,
        "amber-700" => 0xFFB45309,
        "amber-800" => 0xFF92400E,
        "amber-900" => 0xFF78350F,
        "yellow-50" => 0xFFFDF8E3,
        "yellow-100" => 0xFFFDE68A,
        "yellow-200" => 0xFFFBBF24,
        "yellow-300" => 0xFFFAF089,
        "yellow-400" => 0xFFF59E0B,
        "yellow-500" => 0xFFFACC15,
        "yellow-600" => 0xFFD97706,
        "yellow-700" => 0xFFB45309,
        "yellow-800" => 0xFF78350F,
        "yellow-900" => 0xFF6B5300,
        "lime-50" => 0xFFF7FEE7,
        "lime-100" => 0xFFECFCCB,
        "lime-200" => 0xFFD9F99D,
        "lime-300" => 0xFFBEF264,
        "lime-400" => 0xFFA3E635,
        "lime-500" => 0xFF84CC16,
        "lime-600" => 0xFF65A30D,
        "lime-700" => 0xFF4D7C0F,
        "lime-800" => 0xFF3F6212,
        "lime-900" => 0xFF365314,
        "green-50" => 0xFFF0FDF4,
        "green-100" => 0xFFDCFCE7,
        "green-200" => 0xFFBBF7D0,
        "green-300" => 0xFF6EE7B7,
        "green-400" => 0xFF4ADE80,
        "green-500" => 0xFF22C55E,
        "green-600" => 0xFF16A34A,
        "green-700" => 0xFF15803D,
        "green-800" => 0xFF166534,
        "green-900" => 0xFF14532D,
        "emerald-50" => 0xFFE6FDF5,
        "emerald-100" => 0xFFD1FAE5,
        "emerald-200" => 0xFFA7F3D0,
        "emerald-300" => 0xFF6EE7B7,
        "emerald-400" => 0xFF34D399,
        "emerald-500" => 0xFF10B981,
        "emerald-600" => 0xFF059669,
        "emerald-700" => 0xFF047857,
        "emerald-800" => 0xFF065F46,
        "emerald-900" => 0xFF064E3B,
        "teal-50" => 0xFFF0FDFA,
        "teal-100" => 0xFFCCFBF1,
        "teal-200" => 0xFF99F6E4,
        "teal-300" => 0xFF5EEAD4,
        "teal-400" => 0xFF2DD4BF,
        "teal-500" => 0xFF14B8A6,
        "teal-600" => 0xFF0D9488,
        "teal-700" => 0xFF0F766E,
        "teal-800" => 0xFF115E59,
        "teal-900" => 0xFF134E4A,
        "cyan-50" => 0xFFEFFEFC,
        "cyan-100" => 0xFFB9F6FC,
        "cyan-200" => 0xFFA5F3FC,
        "cyan-300" => 0xFF67E8F9,
        "cyan-400" => 0xFF22D3EE,
        "cyan-500" => 0xFF06B6D4,
        "cyan-600" => 0xFF0891B2,
        "cyan-700" => 0xFF0E7490,
        "cyan-800" => 0xFF155E75,
        "cyan-900" => 0xFF164E63,
        "sky-50" => 0xFFECF4FF,
        "sky-100" => 0xFFD9F1FE,
        "sky-200" => 0xFFBAF1FE,
        "sky-300" => 0xFF7DCCFC,
        "sky-400" => 0xFF38B9FC,
        "sky-500" => 0xFF2BAAFF,
        "sky-600" => 0xFF0194C7,
        "sky-700" => 0xFF0369A1,
        "sky-800" => 0xFF065D85,
        "sky-900" => 0xFF0B497A,
        "blue-50" => 0xFFEFEEFF,
        "blue-100" => 0xFFDDDDFF,
        "blue-200" => 0xFFBFE5FE,
        "blue-300" => 0xFF78C5FD,
        "blue-400" => 0xFF4AA1FA,
        "blue-500" => 0xFF3A82EE,
        "blue-600" => 0xFF2576EB,
        "blue-700" => 0xFF0050FF,
        "blue-800" => 0xFF2D50AF,
        "blue-900" => 0xFF3D4C8A,
        "indigo-50" => 0xFFEEF1FF,
        "indigo-100" => 0xFFDDDDFF,
        "indigo-200" => 0xFFBFCAFF,
        "indigo-300" => 0xFFA3B3FF,
        "indigo-400" => 0xFF838FFF,
        "indigo-500" => 0xFF6266FF,
        "indigo-600" => 0xFF443EFF,
        "indigo-700" => 0xFF3939CC,
        "indigo-800" => 0xFF333399,
        "indigo-900" => 0xFF27298C,
        "violet-50" => 0xFFF3EEFF,
        "violet-100" => 0xFFEFE3FF,
        "violet-200" => 0xFFDDE7FF,
        "violet-300" => 0xFFCCCFFF,
        "violet-400" => 0xFFA3B1FF,
        "violet-500" => 0xFF965AFF,
        "violet-600" => 0xFF623AD5,
        "violet-700" => 0xFF5528D9,
        "violet-800" => 0xFF4826B6,
        "violet-900" => 0xFF372899,
        "purple-50" => 0xFFF5E9FF,
        "purple-100" => 0xFFF0C5FF,
        "purple-200" => 0xFFD1BFFF,
        "purple-300" => 0xFFC4A8FF,
        "purple-400" => 0xFFAC84FF,
        "purple-500" => 0xFFAE72FF,
        "purple-600" => 0xFF9534FF,
        "purple-700" => 0xFF7722E6,
        "purple-800" => 0xFF661FCC,
        "purple-900" => 0xFF551D99,
        "fuchsia-50" => 0xFFF7E4FF,
        "fuchsia-100" => 0xFFF0C0FF,
        "fuchsia-200" => 0xFFEBC2FF,
        "fuchsia-300" => 0xFFD66EFF,
        "fuchsia-400" => 0xFFDA00E5,
        "fuchsia-500" => 0xFFE933FF,
        "fuchsia-600" => 0xFFBE1FA9,
        "fuchsia-700" => 0xFFA922BF,
        "fuchsia-800" => 0xFF820F8E,
        "fuchsia-900" => 0xFF70008C,
        "pink-50" => 0xFFFDE1F2,
        "pink-100" => 0xFFF8C1D9,
        "pink-200" => 0xFFF9A1B7,
        "pink-300" => 0xFFEF7AB3,
        "pink-400" => 0xFFF15C91,
        "pink-500" => 0xFFED4899,
        "pink-600" => 0xFFD72578,
        "pink-700" => 0xFFCE155F,
        "pink-800" => 0xFF9D1747,
        "pink-900" => 0xFF830000,
        "rose-50" => 0xFFFFEBF1,
        "rose-100" => 0xFFFFCCD2,
        "rose-200" => 0xFFFDC8CB,
        "rose-300" => 0xFFF0A3B0,
        "rose-400" => 0xFFF17383,
        "rose-500" => 0xFFF25D68,
        "rose-600" => 0xFFDE2936,
        "rose-700" => 0xFFC31232,
        "rose-800" => 0xFF9F1A23,
        "rose-900" => 0xFF881337
    ];

    /**
     * Transform: `color.get('color')` to `Int color`
     * @param id Color name
    */
    public static function getColor(id:String):FlxColor{
        if (checkRGBFormat(id)){ // RGB/RGBA
            var spliter:Array<String> = id.split(delimiter);
            var isFloat:Bool = false;//isFloatColor(spliter)
            if (isFloat){ // Float (FFF)
                var r:Float = Std.parseFloat(spliter[0]); // Red (R)
                var g:Float = Std.parseFloat(spliter[1]); // Green (G)
                var b:Float = Std.parseFloat(spliter[2]); // Blue (B)
                var a:Float = (!isRGBA(id) ? 1.0 : Std.parseFloat(spliter[3])); // Alpha (A)
                #if debug
                    Debug.log("Float: (" + 'R: $r, G: $g, B: $b, A: $a');
                #end
                return FlxColor.fromRGBFloat(r, g, b, a);
            }else{ // Init
                var r:Int = Std.parseInt(spliter[0]); // Red (R)
                var g:Int = Std.parseInt(spliter[1]); // Green (G)
                var b:Int = Std.parseInt(spliter[2]); // Blue (B)
                var a:Int = (!isRGBA(id) ? 255 : Std.parseInt(spliter[3])); // Alpha (A)
                #if debug
                    Debug.log("Init: (" + 'R: $r, G: $g, B: $b, A: $a');
                #end
                return FlxColor.fromRGB(r, g, b, a);
            }
            
        }else if (id.startsWith('0xFF') || id.startsWith('FF')){ // Hexadecimal
            var isStartHex = id.contains('0x');
            var sub = id.substr((!isStartHex ? 2 : 4)); // Remove 0xFF or FF
            var hex = '0x'; // but need this XO
            var result = hex + sub;
            #if debug
                Debug.log('Hex: $result');
            #end
            return FlxColor.fromString(result);
        }else if (colorMap.exists(id)){ // Map String
            var result = colorMap.get(id); // Package OMG
            #if debug
                Debug.log('Color: $result');
            #end
            return FlxColor.fromInt(result);
        }

        return -1;
    }

    static function containsNumber(str:String):Bool{
        var regex:EReg = ~/^\d+$/;
        return regex.match(str);
    }

    //! RGBA SHIT!
    static var delimiter = ",";
    public static function isRGBA(id:String):Bool{
        return id.split(delimiter).length == 4;
    }
    public static function isNumeric(str:String):Bool{
        return new EReg("^-?\\d+$", "").match(str);
    }
    public static function isFloatColor(spliter:Array<String>):Bool{
        for (component in spliter){
            /*if (!isNumeric(component)){
                return false; // Componente não numérico encontrado
                #if debug
                    Debug.log("Non-numeric component found", 'warn);
                #end
            }*/
            
            var value = Std.parseFloat(component);
            if (value < 0.0 || value > 1.0){
                return false;
                #if debug
                    Debug.log("Value out of range of 0 to 1", 'notice');
                #end
            }
        }
        return true;
    }
    public static function checkRGBFormat(id:String):Bool{
        var components:Array<String> = id.split(delimiter);
        if (components.length < 3){
            return false;
            #if debug
                Debug.log('Must have 3 components (RGB) or 4 components (RGBA)', 'notice');
            #end
        }
        
        for (component in components){
            if (component == "" || !isNumeric(component)){
                return false;
                #if debug
                    Debug.log("Non-numeric component found", 'warn');
                #end
            }
            
            var value = Std.parseFloat(component);
            if (components.length == 4 && component == components[3]){
                if (value < 0 || value > 255){
                    return false;
                    #if debug
                        Debug.log("Alpha channel value out of range", 'notice');
                    #end
                }
            }else{
                if (value < 0 || value > 255){
                    return false;
                    #if debug
                        Debug.log("RGB value out of range", 'notice');
                    #end
                }
            }
        }
        return true;
    }
}