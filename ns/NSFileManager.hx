package ns;

enum Response{
	YES;
	NO;
}
typedef NSError=Dynamic
@:native("NSFileManager")
extern class NSFileManager{

	public static function defaultManager():NSFileManager;

	// public inline function createDirectoryAtPath(path:String,withIntermediateDirectories:Response):Void{
	// 	 untyped this.createDirectoryAtPath_withIntermediateDirectories(path,withIntermediateDirectories);
	// }
	public inline function fileExistsAtPath(path:String,isDirectory:Bool):Bool{
		return untyped this.fileExistsAtPath_isDirectory(path,isDirectory);
	}

	public inline function removeItemAtPath(dir:String,?error:NSError=null):Dynamic
	{
		return untyped this.removeItemAtPath_error(dir,error);
	}
	

	public inline  function createDirectoryAtPath(path:String,_withIntermediateDirectories:Bool,?_attributes:Dynamic=null,?_error:Dynamic=null):Void{
		//untyped __js__("[file_manager createDirectoryAtPath:path withIntermediateDirectories:_withIntermediateDirectories attributes:nil error:nil];");
		untyped this.createDirectoryAtPath_withIntermediateDirectories_attributes_error(path,_withIntermediateDirectories,_attributes,_error);
	}
	
}