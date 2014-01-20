extern class NSFileManager{

	public static function defaultManager():Manager;
}




extern class Manager{

	public inline  function createDirectoryAtPath(path:String,_withIntermediateDirectories:Bool,?_attributes:Dynamic,?_error:Dynamic):Void{
		//untyped __js__("[file_manager createDirectoryAtPath:path withIntermediateDirectories:_withIntermediateDirectories attributes:nil error:nil];");
		untyped this.createDirectoryAtPath_withIntermediateDirectories_attributes_error(path,_withIntermediateDirectories,_attributes,_error);
	}
	
}