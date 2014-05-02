package helpers;
using helpers.StringSketch;
import Global.*;
using helpers.Layer;
using helpers.Artboard;
import exp.Config.Conf;
using Lambda;


typedef ExportData={
  path:String,
  slice:MSSlice
}
class Layer{
	public static var mapName:Map<Int,String>=new Map();
	//public static var hiddenLayers:Map<Int,List<MSLayer>>= new Map();

  /// should be removed
	public static function isExportable(layer:MSLayer):Bool{
		_trace( layer);
		//var klass=null;
		
		var isGroup= layer.isGroup();
		//log(  isGroup );
		var cleanName = layer.name().clean();
		//log( cleanName);
		var _isExportable=!cleanName.startsWith("-");
		var force=cleanName.startsWith("+");
		//log( _isExportable);

//     , isGroup = klass === MSLayerGroup
//     , cleanName = _.str.clean([layer name])
//     , isExportable = _.str.startsWith(cleanName, '-')

   		return (isGroup && _isExportable) || force;
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
  public static function isArtBoard(l:MSLayer):Bool{
    var  klass = l._class();
    return  klass== MSArtboardGroup;
  }

	public static function isGroup(l:MSLayer):Bool
	{
		var  klass = l._class();
		return  klass== MSLayerGroup;
	}
	public static function isText(l:MSLayer):Bool
	{
		var  klass = l._class();
		return  klass== MSTextLayer;
	}
  
	public static function export(layer:MSLayer,path:String,factor:Float,config:Conf):String{
   	
   	var invisible:Bool=false;
    var artboard = layer.parentArtboard();
    var page= layer.parentPage();
    artboard.hideOtherLayers(layer);
    if (!layer.isVisible()){
    	invisible=true;
    	layer.setIsVisible(true);
    }
    path = path +"/"+page.name()+"/"+artboard.name()+"/"+  layer.name().clean()+ "."+config.format;
    factor=config.scale;

   	//_trace("here");
    var slice = layer.withFactor(factor);
    //_trace("here");
    doc.saveArtboardOrSlice(slice,path) ;
    //_trace("here");
    if( invisible)layer.setIsVisible(false);
    try artboard.showHiddenLayers() catch( msg:Dynamic)_trace(msg);
   	return path;
  	}
  	public static function exportSvg(layer:MSLayer,path:String,config:Conf):String
  	{
  		var factor=null;
  		path=path.cleanPath();
   	var invisible:Bool=false;
    var artboard = layer.parentArtboard();
    var page= layer.parentPage();
    artboard.hideOtherLayers(layer);
    if (!layer.isVisible()){
    	invisible=true;
    	layer.setIsVisible(true);
    }
    path = path +"/"+page.name()+"/"+ artboard.name()+"/"+ layer.name().clean()+ '.svg';
    //_trace( path +"factor="+Std.string(factor));
    
    factor=config.scale;
   	//_trace("here");
    var slice = layer.withFactor(factor);
    //_trace("here");
    doc.saveArtboardOrSlice(slice,path);
    //_trace("here");
    if( invisible)layer.setIsVisible(false);
    try artboard.showHiddenLayers() catch( msg:Dynamic)_trace(msg);
   	return path;
  	}
  	public static function exportFlat(layer:MSLayer,path:String,factor:Float,config:Conf):String{
  	return export(layer,path,factor,config);
  	}

   public static function withFactor(layer:MSLayer,factor:Float):MSSlice{
    //var layerOrig = this.orig;
    var  copy = layer.duplicate();
    var  frame = copy.frame();
    _trace("here");
    var rect=null;
    //var  rect = [copy rectByAccountingForStyleSize:[[copy absoluteRect] rect]];
    //try  rect = copy.rectByAccountingForStyleSize(copy.absoluteRect().rect()) catch (msg:Dynamic)_trace(msg);
    //_trace("here");
    MSSliceTrimming.trimSlice(copy);
    //var rect=copy.frame().rect();
    var rect=copy.absoluteRect().rect() ;
    var slice = MSSlice.sliceWithRect(rect ,factor);
	 try copy.removeFromParent() catch (msg:Dynamic) log(msg);
    
   // _trace("here");
    return slice;
  }
}