package exp;
import Global.*;
import exp.ExportText;
using helpers.Layer;
using helpers.Document;
import exp.ExportTypes;
import haxe.EnumFlags;
import exp.Behave;
class ExportLayer implements Exportable{

	public var behaviour:EnumFlags<Behave>;
	public var type:ExportTypes;
	public var orig(default,null):MSLayer;
	public var name:String;
	public var x(default,set):Float;
	public var y(default,set):Float;
	public var src:Null<String>;
	public var text:Null<TextProperties>;
	public var relx(default,set):Float;
	public var rely(default,set):Float;
	public var width(default,set):Float;
	public var height(default,set):Float;
	public var visible:Bool=true;
	public function new(layer:MSLayerGroup){
		
		name=Std.string(layer.name()); // i don't get why i should Stringify this ( cause json cannot stringify NSString)
		orig= layer;


		this.type=Container;
		
	}
	function set_relx(f:Float):Float return relx=normalize(f);
	function set_rely(f:Float):Float return rely=normalize(f);
	function set_x(f:Float):Float return x=normalize(f);
	function set_y(f:Float):Float return y=normalize(f);
	function set_width(f:Float):Float return width=normalize(f);
	function set_height(f:Float):Float return height=normalize(f);
	
	public function export():Exportable{
		
		if(orig!=null && behaviour.has(Exportable)){
		visible =(behaviour.has(Behave.Visible))? true : false;
		
		x=orig.absoluteRect().rulerX();
		y=orig.absoluteRect().rulerY();
		width=orig.frame().width();
		height=orig.frame().height();
		relx=orig.frame().x();
		rely=orig.frame().y();
			try{
				if(behaviour.has(Svg)){
					_trace( "--------------svg style--------");
					src=orig.exportSvg(doc.dir()+"view/assets");
					this.type=Svg;
					src=relativeSrc(src);
					return this;
				}
				if( behaviour.has(Scale))
					_trace("-------------------scale"+extractScaleFactor(name));
				if(behaviour.has(Mask)){
					_trace("-------------------------has mask");
				}
				if (!behaviour.has(Flat)){
				src=orig.export(doc.dir()+"view/assets",1);
				}else{
				_trace("-------------------------has flat");
				src=orig.export(doc.dir()+"view/assets",1);
				this.type=Image;
				}
				src=relativeSrc(src);
				_trace("sr="+src);
			}
		
			catch(err:Dynamic){
			log("Error="+err);
			}
		return cast this;
		}
		return null;
	}
	///toFixed // 2digits..
	inline function normalize(f:Float):Float{
		return Math.round(f * 100) / 100;
		//return untyped  (( f * 100 + 0.5)  >> 0) / 100;
	}

	function relativeSrc(absolutePath:String):String
	{
		var relative= StringTools.replace(absolutePath,doc.dir()+"view/","");
		return relative;
	}

	/// not sure
	function extractScaleFactor(name:String):Float
	{
		var r:EReg=~/([*]+\d+)(((.|,)\d+)+)?/;
		r.match(name);
		var ext=(r.matched(0));
		var p= StringTools.replace(ext,"*",'');
		return Std.parseFloat(p);
	}
	public function toObj()
	{
		return {
			name:name,
			 x:x,
			 y:y,
			 width:width,
			 height:height,
			 src:src,
			 text:
			 	(text!=null) ? text.toObj() :null
			 ,
			 relx:relx,
			 rely:rely,
			 children:[]
		}
	}
}