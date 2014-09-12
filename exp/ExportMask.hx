package exp;
using helpers.Layer;
using helpers.Slice;
using helpers.Document;
import exp.ExportTypes;
using helpers.StringSketch;
import Global.*;






class ExportMask extends ExportLayer implements Exportable
{
	var clip:MSLayer;
	var clipped:List<MSLayer>;
public function new(layer:MSLayerGroup)
	{
		super(layer);
		this.type=Mask;

	}
	override public function export():Exportable{
		_trace(this.orig.name() );

		var group:MSLayerGroup = ( this.orig._class()==MSLayerGroup)? cast this.orig :null;
		if( orig.isGroup()){
		
	

			if( group.hasLayerWithMaskMode()==2){
				clipped=new List();
				this.behaviour.set(Flat);
				for ( ch in group.layers()){
					if( ch.hasClippingMask()){
						clip=ch;
						ch.setHasClippingMask(false);
						ch.setIsVisible(false);
						_trace("zorb");
						_trace( "hasLayerWithMaskMode="+ untyped ch.hasLayerWithMaskMode());
						try{
		
						//_trace( untyped ch.clippingMask());
						_trace( untyped ch.isMasked());
						}catch(msg:Dynamic){
							_trace(msg);
						}
					}else{
						clipped.add(ch);
						if( ch.isPartOfClippingMask())_trace(ch.name()+ "is isPartOfClippingMask");
					}

				}
			}
		}
		if( clip!=null){
		var clippedBounds=calculateClipped();
		this.masque={
			x:clip.frame().x(),
			y:clip.frame().x(),
			width:clip.frame().width(),
			height:clip.frame().height()
		};
		}
		
		return super.export();
	}
	function calculateClipped():GKRect
	{
		var bounds:GKRect=null;
		for ( masked in clipped){
			bounds=masked.absoluteRect();
		}
		
		log( bounds);
		return bounds;
	}
	override function afterExport(){
		
		if( clip!=null){
		clip.setHasClippingMask(true);
		clip.setIsVisible(true);
		}
	}

}