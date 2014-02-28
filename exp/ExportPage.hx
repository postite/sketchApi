package exp;
class ExportPage extends ExportContainer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=Page;
	}


}