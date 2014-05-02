package exp;
import Global.*;
import exp.ExportText;
using helpers.Layer;
using helpers.Document;
import exp.ExportTypes;
import haxe.EnumFlags;
import exp.Behave;

class ExportLayer implements Exportable{
	public static var one=true;
	public var behaviour:EnumFlags<Behave>;
	public var type:ExportTypes;
	public var orig(default,null):MSLayer;
	public var name:String="no name";
	public var x(default,set):Float;
	public var y(default,set):Float;
	public var src:Null<String>;
	public var text:Null<TextProperties>;
	public var relx(default,set):Float;
	public var rely(default,set):Float;
	public var width(default,set):Float;
	public var height(default,set):Float;
	public var visible:Bool=true;
	public var format:String="png";
	var exportData:Null<helpers.Layer.ExportData>;
	var config:exp.Config.Conf;
	public function new(layer:MSLayerGroup){
		config=exp.ExportFactory.config;
		
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
		_trace( "export");
		if(orig!=null && behaviour.has(Exportable)){
		visible =(behaviour.has(Behave.Visible))? true : false;
		
		

		
			try{
				if(behaviour.has(Svg)){
					_trace( "--------------svg style--------");
					exportData=orig.exportSvg(doc.dir()+"view/images",config);
					this.type=Svg;
					format="svg";
					src=relativeSrc(exportData.path);
					return this;
				}
				if( behaviour.has(Scale))
					_trace("-------------------scale"+extractScaleFactor(name));
				if(behaviour.has(Mask)){
					_trace("-------------------------has mask");
				}
				if (!behaviour.has(Flat)){
					if (behaviour.has(Skip)) //just testing
					exportData=orig.export(doc.dir()+"view/imuges",1,config);
					else
					exportData=orig.export(doc.dir()+"view/images",1,config);

				}else{
				_trace("-------------------------has flat");
				exportData=orig.export(doc.dir()+"view/images",1,config);
				this.type=Image;
				}
				src=relativeSrc(exportData.path);
				
			}
		
			catch(err:Dynamic){
			log("Error="+err);
			}


		x=exportData.sliced.bounds.x;
		y=exportData.sliced.bounds.y;
		width=exportData.sliced.bounds.width;
		height=exportData.sliced.bounds.height;
		relx=exportData.sliced.bounds.relx;
		rely=exportData.sliced.bounds.rely;


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
			 imageType:format,
			 text:
			 	(text!=null) ? text.toObj() :null
			 ,
			 relx:relx,
			 rely:rely,
			 children:[]
		}
	}
}