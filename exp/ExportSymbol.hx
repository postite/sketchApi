package exp;
using helpers.Layer;
using helpers.Slice;
using helpers.Document;
import exp.ExportTypes;
using helpers.StringSketch;
import Global.*;






class ExportSymbol extends ExportLayer implements Exportable
{

public static var one:Bool=false;


	public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=Symbol;

	}
	
	


}