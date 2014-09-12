package ns;

@:native("NSURL")
@:publicFields
extern class NSURL{
	//static function URLWithString(url:String):
	
	public function absoluteString():String;
	public function absoluteURL():NSURL;
	public function baseURL():NSURL;
	public function fileSystemRepresentation():String;
	public function fragment():String;
	public function host():String;
	public function lastPathComponent():String;
	public function parameterString():String;
	public function password():String;
	public function path():String;
	public function pathComponents():SketchArray<String>;
	public function pathExtension():String;
	public function port():Int;
	public function query():String;
	public function relativePath():String;
	public function relativeString():String;
	public function resourceSpecifier():String;
	public function scheme():String;
	public function standardizedURL():NSURL;
	public function user():String;

}