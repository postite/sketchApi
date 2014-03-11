package exp;
using helpers.Layer;
using helpers.StringSketch;
import Global.*;
import haxe.EnumFlags;
import exp.Behave;

class ExportFactory
{
	
	public static function create(origLayer:MSLayer):Exportable{
		_trace("create");
		var klass= origLayer._class();
		// return switch origLayer{
		// 	case MSTextLayer:
		// 		_trace( "MSTextLayer");
		// 		new exp.ExportText(origLayer);
		// 	default:
		// 		 new exp.ExportLayer(origLayer);
		// }
		var flags=behaviour(origLayer);
		if(origLayer.isVisible()){
			
			flags.set(Behave.Visible);
		}
		var export:Exportable=null;
		untyped log(klass );
		if (klass == MSPage)
			export= new exp.ExportPage(cast origLayer);
		if (klass== MSArtboardGroup)
			export= new exp.ExportArtBoard(cast origLayer);
		if(klass == MSTextLayer)
			export= new exp.ExportText(cast origLayer);
		if(klass == MSShapeGroup || klass==MSBitmapLayer)
			export= new exp.ExportImage(cast origLayer);
		if(klass== MSLayerGroup)
			export=  new exp.ExportContainer(cast origLayer);

			//else
		//export=new exp.ExportLayer(cast origLayer);
		export.behaviour=flags;

		return export;
		//return new exp.ExportLayer(cast origLayer);
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
		 case '-': flags.unset(Exportable);
		 case "+": flags.set(Exportable);
		 case "_":flags.set(Flat);flags.set(Exportable);
		 //case "_":flags.set(Flat);

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

		 if (name.startsWith("m")){
		 	_trace("startwith mask");
		 flags.set(Behave.Mask);
		}
		if( name.endsWith("*2")){
			_trace("endsWith *n");
			flags.set(Behave.Scale);
		}
		 
		 return flags;
	}
	public static function beginWith(phrase:String):String
	{
		return phrase.charAt(0);
	}
	public static function endWith(phrase:String):String
	{
		return phrase.substr(-1);
	}
}