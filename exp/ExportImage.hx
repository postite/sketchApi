package exp;
import exp.ExportTypes;
class ExportImage extends ExportLayer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=Image;
	}
	


}