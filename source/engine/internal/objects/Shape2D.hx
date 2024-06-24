package engine.internal.objects;

import engine.internal.graphics.Graphics;

class Shape2D extends Graphics{
    public function new(widHei:Array<Int>, color:String = ''){
        super(widHei, color);
        #if debug
            trace('NewShape2D, Added');
        #end
    }
}