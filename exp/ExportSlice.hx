package exp;
import Global.*;
import exp.ExportTypes;
class ExportSlice extends ExportLayer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=Slice;
	}
	override public function export():Exportable
	{
		_trace("export Slice");
		 this.x=0;
		 this.y=0;
		 this.relx=0;
		 this.rely=0;
		this.width=0.1;
		this.height=0;
		return cast this;

	}
	


}