package engine.internal.graphics;
class AnimatedSprite extends Sprite{
    /**
     * @param image Image name
     * @param lib Library name
     * @param xml Extesion isXML or Not?
    */
    public function new(image:String, ?lib:String, xml = true){
        super();
        if (xml)
            frames = Paths.getSparrowAtlas(image, lib);
        else
            frames = Paths.getPackerAtlas(image, lib);
    }

    /**
     * [Animation Prefix]
     * @param name Animation name
     * @param prefix XML name
     * @param fps Animation Frame per sec.
     * @param looped Animation isLooped ?
    */
    public function animaPrefix(name:String, prefix:String, ?fps:Float, looped = true):Void{
        var result:Float = 0;
        if (fps == 0 || fps == null)
            result = 24;
        else
            result = fps;

        animation.addByPrefix(name, prefix, result, looped);
    }

    /**
     * [Animation Indices]
     * @param name Animation name
     * @param prefix XML name
     * @param frames Indices Numbers
     * @param fps Animation Frame per sec.
     * @param looped Animation isLooped ?
    */
    public function animaIndice(name:String, prefix:String, frames:Array<Int>, ?fps:Float = 24, looped = true):Void{
        animation.addByIndices(name, prefix, frames, null, fps, looped);
    }

    /**
     * [Animation Frames with Packer Atlas]
     * @param name Animation name
     * @param frames Frame numbers
     * @param fps Animation Frame per sec.
     * @param looped Animation isLooped ?
    */
    public function animaFrame(name:String, frames:Array<Int>, ?fps:Float = 24, looped = true):Void{
        animation.add(name, frames, fps, looped);
    }

    /**
     * [Play Animation & For Looop]
     * @param name Animation name
     * @param force Force animation
     * @param looped Animation can loop
    */
    public function play(name:String, ?force:Bool):Void{
        animation.play(name, force);
    }

    /**
     * Stop animation
    */
    public function stop():Void{
        return animation.curAnim.stop();
    }

    /**
     * Animation Current Frame
    */
    public function cur_frame(?int:Int):Int{
        var item = animation.curAnim.curFrame;
        var result:Dynamic;
        var type:Null<Int> = int;
        if (type == null)
            result = item;
        else
            result = (item = int);

        return result;
    }

    public function finished(?stoped:Bool):Bool{
        var item = animation.curAnim.finished;
        var result:Dynamic;
        var type:Null<Bool> = stoped;
        if (type == null)
            result = item;
        else
            result = (item = stoped);

        return result;
    }
}