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
			// try{
			// 	if(behaviour.has(Svg)){
			// 		_trace( "--------------svg style--------");
			// 		src=orig.exportSvg(doc.dir()+"view/images");
			// 		this.type=Svg;
			// 		src=relativeSrc(src);
			// 		return this;
			// 	}
			// 	if( behaviour.has(Scale))
			// 		_trace("-------------------scale"+extractScaleFactor(name));
			// 	if(behaviour.has(Mask)){
			// 		_trace("-------------------------has mask");
			// 	}
			// 	if (!behaviour.has(Flat)){
			// 		if (behaviour.has(Skip)) //just testing
			// 		src=orig.export(doc.dir()+"view/imuges",1);
			// 		else
			// 		src=orig.export(doc.dir()+"view/images",1);

			// 	}else{
			// 	_trace("-------------------------has flat");
			// 	src=orig.export(doc.dir()+"view/images",1);
			// 	this.type=Image;
			// 	}
			// 	src=relativeSrc(src);
			// 	_trace("sr="+src);
			// }
		
			// catch(err:Dynamic){
			// log("Error="+err);
			// }
			src=null;
		return cast this;
		}
		return null;
	}
	
}