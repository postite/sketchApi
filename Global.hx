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
	public static function getClass(s:Dynamic):String{
		return untyped __js__('s.class()');
	}
	
	public static  var doc:MSDocument;
	public static var selection:SketchArray<MSLayer>; //either MSLAyer or MSLAyerGroup ?
	public static  var hxselection:String; //either MSLAyer or MSLAyerGroup ?


	public static function dump(obj:Dynamic):Void
	{
		var classe:Dynamic=getClass(obj);
        log("#####################################################################################");
        log("## Dumping object " + obj );
        log("## obj class is: " + obj.className());
        log("#####################################################################################");
        log("obj.properties:");
        log(classe.mocha().properties());
        log("obj.propertiesWithAncestors:");
        log(classe.mocha().propertiesWithAncestors());
        log("obj.classMethods:");
        log(classe.mocha().classMethods());
        log("obj.classMethodsWithAncestors:");
        log(classe.mocha().classMethodsWithAncestors());
        log("obj.instanceMethods:");
        log(classe.mocha().instanceMethods());
        log("obj.instanceMethodsWithAncestors:");
        log(classe.mocha().instanceMethodsWithAncestors());
        log("obj.protocols:");
        log(classe.mocha().protocols());
        log("obj.protocolsWithAncestors:");
        log(classe.mocha().protocolsWithAncestors());
        log("obj.treeAsDictionary():");
        log(obj.treeAsDictionary());
    
	}
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
	
	public static inline function writeToFile(content:String,path:String,?atomically:Bool=true):Bool{
		
		var nsContent=NSString.stringWithString(content);
		//var nsContent:NSString=untyped NSString.stringWithUTF8String("contént");
		//var nsContent=untyped __js__("[NSString stringWithCString:[content cStringUsingEncoding:NSISOLatin1StringEncoding] encoding:NSUTF8StringEncoding]");

		return nsContent.writeToFile(path,atomically,untyped NSUTF8StringEncoding,null);
		//return untyped __js__('nsContent
	}
	public static function writeToDir(content:String,path:String,?atomically):Bool{
		var dirs=path.split("/");
		dirs.pop();
		_trace( dirs.join("/"));
		 if(ns.NSFileManager.defaultManager().createDirectoryAtPath(dirs.join("/"),true) )
 		return writeToFile(content,path);
 		return false;
		
	}

	 
}