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
	static var tracable=["helpers.Artboard"];
	public static  var doc:MSDocument;
	public static var selection:SketchArray<MSLayer>; //either MSLAyer or MSLAyerGroup ?
	public static  var hxselection:String; //either MSLAyer or MSLAyerGroup ?

	public static function onelog(m:Dynamic,?p:haxe.PosInfos):Void
	{
		
		 if (cast (Type.resolveClass(p.className)).one){

		_trace=function(m:Dynamic,?p:haxe.PosInfos){};
		log(m);
		untyped __js__("log")(p.className+ " "+p.lineNumber+"");
		
		}
	}
	
	dynamic public static  function _trace(m:Dynamic,?p:haxe.PosInfos)
	{
		#if debug
		untyped __js__("log")(p.className+ " "+p.lineNumber+""+m);
		#end
	}

	public static inline function log(m:Dynamic){
		#if debug
		untyped __js__("log")(m);
		#end
	}
	
	public static inline function writeToFile(content:String,path:String,?atomically:Bool=false):Bool{
		
		var nsContent=NSString.stringWithString(content);
		//var nsContent:NSString=untyped NSString.stringWithUTF8String("contént");
		//var nsContent=untyped __js__("[NSString stringWithCString:[content cStringUsingEncoding:NSISOLatin1StringEncoding] encoding:NSUTF8StringEncoding]");

		return nsContent.writeToFile(path,true,untyped NSUTF8StringEncoding,null);
		//return untyped __js__('nsContent
	}

	 
}