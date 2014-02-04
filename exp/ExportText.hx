package exp;

class ExportText extends ExportLayer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		trace( "hello text");
		super(layer);
	}
}