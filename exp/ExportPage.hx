package exp;
class ExportPage extends ExportContainer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=Page;
		
	}

	override public function export():Exportable
	{
		
		 this.x=0;
		 this.y=0;
		 this.relx=0;
		 this.rely=0;
		this.width=0.1;
		this.height=0;
		return cast this;

	}


}