package ns;
@:native("NSString")
extern class NSString{

	public static function stringWithString(s:String):NSString;
	inline public function writeToFile(path:String,atomically:Bool):Bool{
		return untyped this.writeToFile_atomically(path,atomically);
	}
}