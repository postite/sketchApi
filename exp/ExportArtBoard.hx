package exp;
import exp.ExportTypes;
class ExportArtBoard extends ExportContainer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=ArtBoard;
	}


}