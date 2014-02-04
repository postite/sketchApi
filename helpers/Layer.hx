package helpers;
using helpers.StringSketch;
import Global.*;
using helpers.Layer;
using helpers.Artboard;
class Layer{
	public static var mapName:Map<Int,String>=new Map();
	//public static var hiddenLayers:Map<Int,List<MSLayer>>= new Map();
	public static function isExportable(layer:MSLayer):Bool{
		log( layer);
		//var klass=null;
		
		var isGroup= layer.isGroup();
		log(  isGroup );
		var cleanName = layer.name().clean();
		log( cleanName);
		var _isExportable=cleanName.startsWith("-");
		log( _isExportable);

//     , isGroup = klass === MSLayerGroup
//     , cleanName = _.str.clean([layer name])
//     , isExportable = _.str.startsWith(cleanName, '-')

   		return isGroup && _isExportable;
// }
	}
	
	public static function setMapName(layer:MSLayer,val:String):Void{
		 try mapName.set(layer.hash(),val) catch(err:Dynamic)log(err);
	}
	public static function getMapName(layer:MSLayer):String{
		return mapName.get(layer.hash());
		return "pop";
	}
	public static function _class(layer:MSLayer):Class<Dynamic>
	{
		return untyped __js__("layer.class()");
	}

	public static function isGroup(l:MSLayer):Bool
	{
		var  klass = l._class();
		return  klass== MSLayerGroup;
	}

	public static function export(layer:MSLayer,path:String, factor:Float):String{
    var r:EReg=~/\/+$/;
    path = r.replace(path,'');
    var artboard = layer.parentArtboard();
    artboard.hideOtherLayers(layer);
    path = path +  layer.name().clean()+ '.png';
    _trace( path +"factor="+Std.string(factor));
   // factor = factor || 1;
   	factor= (factor!=null)? factor :1;
   	_trace("here");
    var slice = layer.withFactor(factor);
    _trace("here");
    doc.saveArtboardOrSlice(slice,path);
    _trace("here");
    //[doc saveArtboardOrSlice:slice toFile:path]
    try artboard.showHiddenLayers() catch( msg:Dynamic)_trace(msg);
   	return path;
  }

   static function withFactor(layer:MSLayer,factor:Float):MSSlice{
    //var layerOrig = this.orig;
    var  copy = layer.duplicate();
    var  frame = copy.frame();
    _trace("here");
    var rect=null;
    //var  rect = [copy rectByAccountingForStyleSize:[[copy absoluteRect] rect]];
   try  rect =  copy.rectByAccountingForStyleSize(copy.absoluteRect().rect()) catch (msg:Dynamic)_trace(msg);
    _trace("here");
    var slice = MSSlice.sliceWithRect(rect ,factor);
	log(copy);
    try copy.removeFromParent() catch (msg:Dynamic) log(msg);
    _trace("here");
    return slice;
  }
}