package exp;

interface Exportable{


	public var orig(default,null):MSLayer;
	public var name:String;
	public var x(default,null):Float;
	public var y(default,null):Float;
	public var src:String;
	public function toObj():Dynamic;
}