package ns;
@:native("NSImage")
@:publicFields
extern class{
	static function alloc():NSImage;
	function initWithContentsOfFile(fileurl:String):NSImage; //tested
}