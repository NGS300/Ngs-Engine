package engine;
#if !macro
    import engine.internal.Persist;
    import engine.Paths;
    import flixel.FlxG; // This one in particular causes a compile error if you're using macros.
    import flixel.system.debug.watch.Tracker;

    using Lambda;
    using StringTools;
    using engine.internal.util.tools.ArraySortTools;
    using engine.internal.util.tools.ArrayTools;
    using engine.internal.util.tools.ICloneable;
    using engine.internal.util.tools.FloatTools;
    using engine.internal.util.tools.Int64Tools;
    using engine.internal.util.tools.IntTools;
    using engine.internal.util.tools.IteratorTools;
    using engine.internal.util.tools.MapTools;
    using engine.internal.util.tools.StringTools;
#end