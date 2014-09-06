package exp;
using helpers.Layer;
using helpers.Slice;
using helpers.Document;
import exp.ExportTypes;
using helpers.StringSketch;
import Global.*;

typedef OriginalId=String;
typedef SymbolName=String;
class ExportSymbol extends ExportLayer implements Exportable
{
	static var symbols:Map<OriginalId,SymbolName>;
	//static var css:Map<StyleName,TextProperties>;
	public function new(layer:MSLayerGroup)
	{
		init();
		super(layer);
		this.type=Symbol;

	}

	function  init():Void
	{
		if(symbols==null){
			symbols=new Map();
			//css=new Map();
			var symbolsData=doc.documentData().layerSymbols().objects();
			for ( symData in symbolsData){
				for (i in  (symData.instances():SketchArray<Dynamic>))
				symbols.set(symData.symbol().originalObjectID(),symData.name());
			
			}
			
		}
	}
	public function symbolName():String
	{
		return (getStyleName(this.orig.originalObjectID()));
	}
	public function getStyleName(id:OriginalId):String
	{
		return symbols.get(id);
	}

	override function export():Exportable
	{
		super.export();
		return this;
	}
	
	


}