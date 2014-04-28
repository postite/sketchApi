package helpers;
import Global.*;
using helpers.Artboard;
using helpers.StringSketch;
using helpers.Layer;

typedef SliceOptions={
	scale:Float,
	suffix:String,
	format:Format
}
//move away
enum Format{
	Png;
	Svg;
	Jpg;
	Pdf;
	Tiff;
	Eps;
}

class Slice{



	public static var one=false;

	//return path
	//supports only one export size for now
	//TODO add suffix
	public static function export(slice:MSSliceLayer,orig:MSLayer,path:String,factor:Float):String{
		//extract properties

	
	
	var options:SliceOptions= cast {};
	var firstOption=slice.exportOptions().sizes().firstObject();
	
	options.format=Type.createEnum(Format,Std.string(firstOption.format()).capitalize() );
	options.suffix=firstOption.name();
	options.scale=firstOption.scale();

	//var layer:MSLayer=firstOption.parentLayer();
	var layer=orig;
	onelog("layer"+layer.name());

	var invisible:Bool=false;
    var artboard = layer.parentArtboard();
    var page= layer.parentPage();
    artboard.hideOtherLayers(layer);
    if (!layer.isVisible()){
    	invisible=true;
    	layer.setIsVisible(true);
    }
    path = path +"/"+page.name()+"/"+artboard.name()+"/slices/"+  layer.name().clean()+ '.'+Std.string(options.format).toLowerCase();
    _trace( path +"factor="+Std.string(factor));
   	
   	//var factor= (options.scale!=null)? options.scale :1;
   	var factor=options.scale ;
   	//_trace("here");
    var exportslice = slice.withFactor(factor);
    //_trace("here");
    doc.saveArtboardOrSlice(exportslice,path);
    //_trace("here");
    if( invisible)layer.setIsVisible(false);
    try artboard.showHiddenLayers() catch( msg:Dynamic)_trace(msg);
   	return path;
	}
}