package exp;
import haxe.EnumFlags;
import exp.Behave;
interface Exportable{

	public var behaviour:EnumFlags<Behave>;
	public var orig(default,null):MSLayer;
	public var name:String;
	public var x(default,null):Float;
	public var y(default,null):Float;
	public var relx(default,null):Float;
	public var rely(default,null):Float;
	public var height(default,null):Float;
	public var width(default,null):Float;
	public var src:String;
	public var type:exp.ExportTypes;
	public function toObj():Dynamic;
	public function export():Exportable;
}