package exp;
import Global.*;
import exp.ExportText;
using helpers.Layer;
using helpers.Document;
class ExportLayer implements Exportable{

	public var orig(default,null):MSLayer;
	public var name:String;
	public var x(default,set):Float;
	public var y(default,set):Float;
	public var src:Null<String>;
	public var text:Null<TextProperties>;
	public var relx(default,set):Float;
	public var rely(default,set):Float;
	public function new(layer:MSLayerGroup){
		
		if(layer!=null){
		orig= layer;
		name=layer.name()+"export";
		x=layer.absoluteRect().rulerX();
		y=layer.absoluteRect().rulerY();
		relx=layer.frame().x();
		rely=layer.frame().y();

		try
		src=orig.export(doc.dir()+"exported",1)
		catch(err:Dynamic)
		log("Error="+err);
		}
	}
	function set_relx(f:Float):Float return relx=normalize(f);
	function set_rely(f:Float):Float return rely=normalize(f);
	function set_x(f:Float):Float return x=normalize(f);
	function set_y(f:Float):Float return y=normalize(f);
	

	///toFixed // 2digits..
	inline function normalize(f:Float):Float{
		return Math.round(f * 100) / 100;
		//return untyped  (( f * 100 + 0.5)  >> 0) / 100;
	}
	public function toObj()
	{
		return {
			name:name,
			x:x,
			y:y,
			src:src,
			text:
				(text!=null) ? text.toObj() :"null"
			,
			relx:relx,
			rely:rely,
			children:[]
		}
	}
}