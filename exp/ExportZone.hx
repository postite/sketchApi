package exp;
import Global.*;
class ExportZone extends ExportLayer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		if( layer!= null){
		super(layer);
		this.type=Zone;
		}
		
	}
	override function export():Exportable
	{
		
	if(orig!=null && behaviour.has(Exportable)){
		visible =(behaviour.has(Behave.Visible))? true : false;
		
		x=orig.absoluteRect().rulerX();
		y=orig.absoluteRect().rulerY();
		width=orig.frame().width();
		height=orig.frame().height();
		relx=orig.frame().x();
		rely=orig.frame().y();
		src=null;
		return cast this;
		}
		return null;
	}
	
}