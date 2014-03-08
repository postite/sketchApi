package exp;
import exp.ExportTypes;
class ExportArtBoard extends ExportContainer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=ArtBoard;
	}

	override public function export():Exportable
	{
		
		this.x=2;
		this.y=2;
		this.relx=3;
		this.rely=3;
		this.width=100.1;
		this.height=100;
		return cast this;

	}
}