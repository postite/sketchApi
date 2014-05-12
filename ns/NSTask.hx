package ns;
@:native("NSTask")
extern class NSTask{
	//don't get that stuff
	static public function alloc():NSTask;
	public function init():ns.NSTask;
	public function setCurrentDirectoryPath(path:String):Void;
	public function setLaunchPath(s:String):Void;
	public function launch():Void;
	 public function setArguments(args:ns.NSArray):Void;

	
	
	
}