package ns;

@:publicFields
@:native("NSImage")
extern class NSImage{
	static function alloc():NSImage;
	function initWithContentsOfFile(fileurl:String):NSImage; //tested
}