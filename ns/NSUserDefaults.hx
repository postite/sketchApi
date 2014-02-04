package ns;
@:native("NSUserDefaults")
extern class NSUserDefaults{
	//@:see https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/Reference/Reference.html
	public static function standardUserDefaults():NSUserDefaults;

	public function integerForKey(key:String):Int;
	inline public function setInteger(value:Int,key:String):Void{
		untyped this.setInteger_forKey(value,key);
	}

}