package exp;
import Global.*;
class ExportContainer extends ExportLayer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		_trace( "hello container");
		super(layer);
	}
}