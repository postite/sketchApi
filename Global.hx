 class Global
{

public function new()
{
	
}
	public static function __init__():Void {
		
        untyped __js__("Global.doc = doc");
        untyped __js__("Global.selection = selection");

    	
}
	
	public static  var doc:MSDocument;
	public static var selection:SketchArray<Dynamic>; //either MSLAyer or MSLAyerGroup ?
	public static inline function log(m:String)
	{
		untyped log(m);
	}
}