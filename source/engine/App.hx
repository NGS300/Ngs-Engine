package engine;
import lime.app.Application;
class App extends Application{

    /**
     * @param name Title Name
    */
    public static function title(?name:String, deffault = false):String{
        var engi = Persist.ENGINE;
        var result:String = '';
        var tit = Application.current.window.title;
        if (deffault) // default TRUE
            result = tit = engi.title;
        else
            result = tit = engi.title = name;
        return result;
    }

    public static function windowMove(xy:Array<Null<Int>>){
        var result = [xy[0], (xy[1] > 0 ? - xy[1] : - xy[1])];
        var ignore:Array<Bool> = [false, false];
        if (xy[0] == null)
            ignore[0] = true;
        else if (xy[1] == null)
            ignore[1] = true;

        var win = Application.current.window;
        if (!ignore[0])
            win.x += result[0];
        if (!ignore[1])
            win.y += result[1];
    }

    public static function windowPos(xy:Array<Null<Int>>){
        var result = xy;
        var ignore:Array<Bool> = [false, false];
        if (xy[0] == null)
            ignore[0] = true;
        else if (xy[1] == null)
            ignore[1] = true;

        var win = Application.current.window;
        if (!ignore[0])
            win.x = result[0];
        if (!ignore[1])
            win.y = result[1];
    }

    /**
     * [App Get]
     * @param get Meta Name
    */
    public static function get(get:String):Null<String>{
        var push = Application.current.meta.get;
        var result:String = '';
        switch (get){
            case 'v' | 'version': result = push('version');
            case 't' | 'title': result = push('title');
        }
        return result;
    }
}