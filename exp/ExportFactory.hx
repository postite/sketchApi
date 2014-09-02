package exp;
using helpers.Layer;
using helpers.StringSketch;
import Global.*;
import haxe.EnumFlags;
import exp.Behave;
using helpers.UI;

typedef Props={
	key:String,
	value:String,
}


class ExportFactory
{
	static var props:Dynamic;
	static var flags:EnumFlags<Behave>;
	public static var one=false;
	public static var config:Config.Conf=Config.defaults;
	//bon faut faire le ménage la dedans!
	public static function create(origLayer:MSLayer):Exportable{
		_trace("factory--------------createExport "+origLayer.name()+"-------------");
		var klass= origLayer._class();
		// return switch origLayer{
		// 	case MSTextLayer:
		// 		_trace( "MSTextLayer");
		// 		new exp.ExportText(origLayer);
		// 	default:
		// 		 new exp.ExportLayer(origLayer);
		// }

		//Std.string(config).alert("config");

		 flags=behaviour(origLayer);
		var export:Exportable=null;
		 props=splitSlash(origLayer.name());
		 _trace( "props="+props);
		if (flags.has(Behave.Exportable)){


		if(origLayer.isVisible()){
			
			flags.set(Behave.Visible);
		}
		if(origLayer.isLayerExportable()&& !origLayer.isArtBoard()){
			_trace("isLayerExportable "+ origLayer.name());
			flags.set(Sliced);flags.set(Flat);
		}
		if(origLayer.isGroup() && origLayer.layers().length>0){
		var lastLayerOf=origLayer.layers().firstObject();
		_trace("lastLayerOf=");
		log( lastLayerOf._class() );

		if(lastLayerOf._class()==MSSliceLayer){
		_trace( "isSliced");
		flags.set(Sliced);flags.set(Flat);



		export= new exp.ExportSlice(cast lastLayerOf);
			flags.set(Flat);
			assign(export);
			return export;
		}
		}

		if(klass==MSSliceLayer){
		export=new exp.ExportSlice(cast origLayer);
		flags.has(Behave.Sliced);
		assign(export);
		return export;
		}
		if(flags.has(Behave.Sliced)){
			_trace( "behave Sliced");
			export= new exp.ExportSlice(cast origLayer);
			flags.set(Flat);
			assign(export);
			return export;
		}
		if( flags.has(Behave.Mask)){
			_trace ("behave mask");
			export= new exp.ExportMask(cast origLayer);
			flags.set(Flat);
			assign(export);
			return export;
		}
		if( flags.has(Behave.Zone)){
			export = new exp.ExportZone(cast origLayer);
			assign(export);
			return export;
		}

		
		_trace(klass );
		if (klass == MSPage){
			export= new exp.ExportPage(cast origLayer);
			assign(export);
			return export;
		}
		if (klass== MSArtboardGroup){
			export= new exp.ExportArtBoard(cast origLayer);
			assign(export);
			
			return export;
		}
		if(klass == MSTextLayer){
			export= new exp.ExportText(cast origLayer);
			assign(export);
			return export;
		}
		if(klass == MSShapeGroup || klass==MSBitmapLayer){
			export= new exp.ExportImage(cast origLayer);
			assign(export);
			return export;
		}
		

		

		if(klass== MSLayerGroup  && !flags.has(Behave.Flat)){
			export=  new exp.ExportContainer(cast origLayer);
			onelog("ExportContainer");
			assign(export);
			return export;
		}

		_trace("hact as regular layer");
		
		export= new exp.ExportImage(cast origLayer);
		assign(export);
		return export;
		}
		return null;
	}

	static function assign(export:Exportable){
		//assign additional props (name/key/value/key/value)
		export.props=props;
		export.behaviour=flags;
	}

	static function behaviour(orig:MSLayer):EnumFlags<Behave>
	{
		
		var name:String= orig.name();
		var behaviour=extract(name);

		return behaviour;
	}

	public static dynamic function extract(name:String):EnumFlags<Behave>
	{
		var flags=new EnumFlags();
		_trace("extract="+name);
		//return true;

		 switch(beginWith(name)){
		 
		// case "#": flags.set(Behave.set);
		 case '*':flags.set(Behave.Svg);flags.set(Exportable);flags.set(Flat);
		 
		 case "+": flags.set(Exportable);
		 case "_":flags.set(Flat);flags.set(Exportable);
		 case "°":flags.set(Skip);flags.set(Exportable);
		 case "#":flags.set(Mask);flags.set(Exportable);
		 case "|":flags.set(Zone);flags.set(Exportable);
		 //case "_":flags.set(Flat);
		 case '-': flags.unset(Exportable);
		 case _:flags.set(Behave.Exportable);

		 //default:  false;
		 }

		 // switch(endWith(name)){
		 // 	case "@":
		 // 	trace( "@");
		 // 	flags.unset(DIESE);
		 // 	case "-":
		 // 	flags.unset(PLUS);
		 // 	case "+":
		 // 	//flags.unset(PLUS);
		 // 	flags.set(MAX);
		 // }

		
		if( name.endsWith("*2")){
			//_trace("endsWith *n");
			flags.set(Behave.Scale);
		}
		// _trace( "end");
		 return flags;
	}
	public static function splitSlash(phrase:String):Dynamic{
		var tab=phrase.split("/");
		if( tab.length==0)return null;
		 var props= {};
		var count:Int=1;
		while (count<tab.length){
			var key=tab[count];
			
			Reflect.setField(props,key,tab[count+1]);
			
			//Reflect.setField(props,"one","two");
			//props.setField(props,tab[count],tab[count+1]);
			
			count+=2;
		}
		
		
		return props;
		
		
	}
	public static function beginWith(phrase:String):String
	{
		return phrase.charAt(0);
	}
	public static function endWith(phrase:String):String
	{
		return phrase.substr(-1);
	}
	public static function secondWith(phrase:String):String
	{
		return phrase.charAt(1);
	}
}

class PropTool{

}