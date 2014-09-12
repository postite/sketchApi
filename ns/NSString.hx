package ns;
@:native("NSString")
extern class NSString{

	public static function stringWithString(s:String):NSString;
	inline public function writeToFile(path:String,atomically:Bool,encoding:Dynamic,error:Dynamic):Bool{
		return untyped this.writeToFile_atomically_encoding_error(path,atomically,encoding,error);
	}
}

@:native("NSData")
extern class NSData{
	inline public function writeToFile(path:String,atomically:Bool):Bool{
		Global.writeToDir("",path,true);
		return untyped this.writeToFile_atomically(path,atomically);
	}
}