package engine.internal.graphics;

import flixel.util.FlxAxes;
import flixel.FlxSprite;

class Sprite extends FlxSprite{

    /**
     * @param image Image name
     * @param lib Library name
    */
    public function new(?image:String, ?lib:String){
        super(0, 0);
        antialiasing = true;
        loadGraphic(Paths.image(image, lib));
    }

    /**
     * [Visible Object]
     * @param show Make Object Visible `OFF` & `ON`
    */
    public function show(show:Bool){
        visible = show;
    }

    /**
     * [Object Position]
     * 
     * X & Y position of the upper left corner of this object in world space.
     * 
     * [`X`] goes right & [`-X`] goes left
     * 
     * [`Y`] goes up & [`-Y`] goes down
     * @param xy Position `[x, y]`
    */
    public function pos(?xy:Array<Float>):Void{
        var i = xy;
        x = i[0];
        y = (i[1] > 0 ? - i[1] : - i[1]);
    }

    /**
     * [Scroll Factor]
     * 
     * Set the coordinates of this point object. 
     * Controls how much this object is affected by camera scrolling. 0 = no movement (e.g. a background layer), 1 = same movement speed as the foreground.
     * @param factor scrol `[x, y]`
    */
    public function scroll(?factor:Array<Float>):Void{
        var i = factor;
        scrollFactor.set(i[0], i[1]);
    }

    /**
     * Whether this sprite is flipped on the X & Y axis.
     * @param xy flip `[x, y]`
    */
    public function flip(?xy:Array<Bool>):Void{
        var i = xy;
        flipX = i[0];
        flipY = i[1];
    }

    /**
     * The width & height of this object's hitbox. For sprites, use `offset` to control the hitbox position
     * @param widHei size `[x, y]`
    */
    public function widHei(?widHei:Array<Float>):Void{
        var i = widHei;
        if (i[0] != 0)
            width = i[0];
        if (i[1] != 0)
            height = i[1];
    }

    /**
     * [Scale Postion]
     * 
     * Change the size of your sprite's graphic
     * @param xy scale `[x, y]`
    */
    public function scalePos(?xy:Array<Float>):Void{
        var i = xy;
        if (i[0] != 0)
            scale.x = i[0];
        if (i[1] != 0)
            scale.y = i[1];
        upBox();
    }

    /**
     * [Scale Set]
     * 
     * Set the coordinates of this point object
     * @param set scale `[x, y]`
    */
    public function scaleSet(?set:Array<Float>):Void{
        var i = set;
        scale.set(i[0], i[1]);
        upBox();
    }
    
    /**
	 * Helper function to set the graphic's dimensions by using `scale`, allowing you to keep the current aspect ratio
     * 
     * @param widHei size `[width, height]`, How wide the graphic should be. If <= 0, and width & height is set, the aspect ratio will be kept
     * @param Free Unlock the `dimesion` value * `widHei` value to `dimesion` value
	*/
    public function graphicSize(widHei:Array<Float>, free = false){
        var i = widHei;
        var curVar:Array<Float> = [];
        if (free)
            curVar =[
                i[0], // Width
                i[1] // Height
            ];
        else{
            var id:Array<Float> = [];
            if (i[0] != 0 || i[0] <= 0.0) // Width
                id[0] = i[0];
            if (i[1] != 0 || i[1] <= 0.0) // Height
                id[1] = i[1];
            curVar =[
                Std.int(width * id[0]),
                Std.int(height * id[1])
            ];
        }
        setGraphicSize(curVar[0], curVar[1]);
        upBox();
    }

    /**
	 * Centers this `FlxObject` on the screen, either by the x axis, y axis, or both.
	 *
	 * @param axes On what axes to center the object (e.g. `X`, `Y`, `XY`) - default is both.
	*/
    public function center(axes:String = 'XY'):Void{
        var i = axes;
        var id:FlxAxes;
        if (i == 'XY')
            id = XY;
        else if (i == 'X')
            id = X;
        else if (i == 'Y')
            id = Y;
        else
            id = NONE;
        screenCenter(id);
    }

    /**
     * Scale this point
     * 
     * `X` - scale `X` coefficient.
     * 
     * `Y` - scale `Y` coefficient, if omitted, `X` is used
     * 
     * @param xy
    */
    public function offsetScale(?xy:Array<Null<Float>>):Void{
        var i = xy;
        var id:Float = xy[1];
        if (xy[1] == null)
            id = i[0];

        offset.scale(i[0], id);
    }

    /**
     * [Update Hitbox]
    */
    public function upBox():Void{
        updateHitbox();
    }
}