 import ns.NSString;
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
	public static var selection:SketchArray<MSLayer>; //either MSLAyer or MSLAyerGroup ?
	public static  var hxselection:String; //either MSLAyer or MSLAyerGroup ?

	public static inline function _trace(m:Dynamic,?p:haxe.PosInfos)
	{
		untyped __js__("log")(p.className+ " "+p.lineNumber+""+m);
		//log(m);
	}

	public static inline function log(m:Dynamic){
		untyped __js__("log")(m);
	}

	public static inline function writeToFile(content:String,path:String,?atomically:Bool=false):Bool{
		
		var nsContent=NSString.stringWithString(content);
		return nsContent.writeToFile(path,atomically);
	}

	 
}