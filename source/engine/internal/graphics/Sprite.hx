package engine.internal.graphics;

import flixel.util.FlxColor;
import engine.internal.util.ColorsUtil;
import flixel.util.FlxAxes;
import flixel.FlxSprite;

class Sprite extends FlxSprite{
    /**
     * @param image Image name
     * @param lib Library name
    */
    public function new(?image:String, ?lib:String){
        super(0, 0);
        loadGraphic(Paths.image(image, lib));
        scrollFactor.set(0, 0);
        antialiasing = true;
    }

    /*public function find(type:String){
        var result = '';
        switch (type){
            case 'XY':
                result = ''
        }
        return Debug.log(  + result);
    }*/

    public function alpha_(alpha = 1.0){
        return this.alpha = alpha;
    }

    public function color_(color:String):FlxColor{
        return this.color = ColorsUtil.getColor(color);
    }

    /**
     * [Visible Object]
     * @param visible Make Object Visible `OFF` & `ON`
    */
    public function visible_(visible:Bool){
        this.visible = visible;
    }
    
    /**
     * [Object Position]
     * 
     * X & Y position of the upper left corner of this object in world space.
     * 
     * [`X`] goes right & [`-X`] goes left
     * 
     * [`Y`] goes down & [`-Y`] goes up
     * @param x_y[0] Position `X`
     * @param x_y[1] Position `Y`
    */
    public function position(?x_y:Array<Null<Float>>):Void{
        var i = x_y;
        if (i[0] != null)
            this.x = i[0];

        if (i[1] != null)
            this.y = (i[1] > 0 ? i[1] : - i[1]);
    }

    /**
     * [Scroll Factor]
     * 
     * Set the coordinates of this point object. 
     * Controls how much this object is affected by camera scrolling. 0 = no movement (e.g. a background layer), 1 = same movement speed as the foreground.
     * @param scroll_Factor[0] Scroll `X`
     * @param scroll_Factor[1] Scroll `Y`
    */
    public function scroll_factor(?scroll_Factor:Array<Null<Float>>):Void{
        var i = scroll_Factor;
        var result:Array<Float> = [];
        if (i[0] == null)
            result[0] = i[1];
        else if (i[0] <= 0)
            result[0] = 0.1;
        else
            result[0] = i[0];

        if (i[1] == null)
            result[1] = i[0];
        else if (i[1] <= 0)
            result[1] = 0.1;
        else
            result[1] = i[1];

        scrollFactor.set(result[0], result[1]);
    }

    /**
     * Whether this sprite is flipped on the X & Y axis.
     * @param x_y[0] Flip `X`
     * @param x_y[1] Flip `Y`
    */
    public function flip(?x_y:Array<Null<Bool>>):Void{
        var i = x_y;
        if (i[0] != null)
            flipX = i[0];

        if (i[1] != null)
            flipY = i[1];
    }

    /**
     * The width & height of this object's hitbox. For sprites, use `offset` to control the hitbox position
     * @param width_Height[0] Size `X`
     * @param width_Height[1] Size `Y`
    */
    public function width_height(?width_Height:Array<Null<Float>>):Void{
        var i = width_Height;
        if (i[0] != 0 || i[0] != null)
            width = i[0];

        if (i[1] != 0 || i[1] != null)
            height = i[1];
    }

    /**
     * [Scale Postion]
     * 
     * Change the size of your sprite's graphic
     * @param x_y[0] Scale `X`
     * @param x_y[1] Scale `Y`
    */
    public function scale_position(?x_y:Array<Null<Float>>):Void{
        var i = x_y;
        if (i[0] != 0 || i[1] != null)
            scale.x = i[0];

        if (i[1] != 0 || i[1] != null)
            scale.y = i[1];
        
        updateBox();
    }

    /**
     * [Scale Set]
     * 
     * Set the coordinates of this point object
     * @param scale_Set[0] Scale `X`
     * @param scale_Set[1] Scale `Y`
    */
    public function scale_set(?scale_Set:Array<Null<Float>>):Void{
        var i = scale_Set;
        var result:Array<Float> = [1, 1];
        if (i[0] != 0 || i[0] != null)
            result[0] = i[0];

        if (i[1] != 0 || i[1] != null)
            result[1] = i[1];

        scale.set(result[0], result[1]);
        updateBox();
    }
    
    /**
	 * Helper function to set the graphic's dimensions by using `scale`, allowing you to keep the current aspect ratio
     * 
     * @param width_Height[0] Size `[width]`, How wide the graphic should be. If <= 0, and width is set, the aspect ratio will be kept
     * @param width_Height[1] Size `[height]`, How wide the graphic should be. If <= 0, and height is set, the aspect ratio will be kept
     * @param free Unlock the `dimesion` value * `widHei` value to `dimesion` value
	*/
    public function graphicSize(width_Height:Array<Null<Float>>, free = false){
        var i = width_Height;
        var result:Array<Float> = [-1, -1];
        if (i[0] <= 0 && i[1] <= 0)
            return;

        var id:Array<Float> = [-1, -1];
        if (free){
            if (i[0] != 0 || i[0] != null) // Width
                id[0] = i[0];

            if (i[1] != 0 || i[1] != null) // Height
                id[1] = i[1];

            result = [
                id[0], // Width
                id[1] // Height
            ];
        }else{
            if (i[0] != 0 || i[0] != null) // Width
                id[0] = i[0];

            if (i[1] != 0 || i[1] != null) // Height
                id[1] = i[1];
            
            result = [
                Std.int(width * id[0]),
                Std.int(height * id[1])
            ];
        }

        setGraphicSize(result[0], result[1]);
        updateBox();
    }

    /**
	 * Centers this `FlxObject` on the screen, either by the x axis, y axis, or both.
	 *
	 * @param axes On what axes to center the object (e.g. `X`, `Y`, `XY`) - default is both.
	*/
    public function center(axes = 'XY'):Void{
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
     * @param x_y[0] `X`
     * @param x_y[1] `Y`
    */
    public function offset_(?x_y:Array<Null<Float>>):Void{
        var i = x_y;
        var id:Float = x_y[1];
        if (i[1] == 0 || i[1] == null)
            id = i[0];

        offset.scale(i[0], id);
    }

    /**
     * [Update Hitbox]
    */
    public function updateBox():Void{
        return updateHitbox();
    }
}