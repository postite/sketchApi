package exp;
import Global.*;
class ExportContainer extends ExportLayer implements Exportable
{


	public function new(layer:MSLayerGroup)
	{
		if( layer!= null){
		// _trace( "hello container");
		// name=layer.name()+"---container";
		// _trace("i'ma a group "+ layer.hasLayerWithMaskMode());
		// if( layer.hasLayerWithMaskMode()==2 ){
		// 	_trace("-------------mask found");
		// 	for ( l in layer.layers()){
		// 		if (l.hasClippingMask()){_trace("i'm the mask "+ l.name());
		// 		_trace("mask color border="+ l.style().borders().firstObject().color().hexValue());
		// 		 var shape:MSShapeGroup= cast l;
		// 		shape.setHasClippingMask(false) ; //toggle

		// 		}
		// 	}
		//}
		super(layer);
		this.type=Container;
		}
	}
	
}