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
		
		this.x=0;
		this.y=0;
		this.relx=0;
		this.rely=0;
		this.width=orig.frame().width();
		this.height=orig.frame().height();
		return cast this;

	}
}