package exp;
import Global.*;
class ExportText extends ExportLayer implements Exportable
{


	public function new(layer:MSTextLayer)
	{
		_trace( "hello text");
		super(cast layer);
	}
}