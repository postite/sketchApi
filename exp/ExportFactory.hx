package exp;
using helpers.Layer;
import Global.*;
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
		if (klass == MSPage)
			return untyped new exp.ExportContainer(cast origLayer);
		if (klass== MSArtboardGroup)
			return untyped new exp.ExportContainer(cast origLayer);
		if(klass == MSTextLayer)
			return untyped new exp.ExportText(cast origLayer);
		if(klass== MSLayerGroup)
			return  untyped  new exp.ExportContainer(cast origLayer);

		return new exp.ExportLayer(cast origLayer);
	}
}