package exp;


class ExportFactory
{
	
	public static function create(origLayer:MSLayerGroup):Exportable{

		return switch origLayer{
			case MSTextLayer:
				new exp.ExportText(origLayer);
			default:
				 new exp.ExportLayer(origLayer);
		}
	}
}