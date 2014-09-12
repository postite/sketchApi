package helpers;
using helpers.StringSketch;
import Global.*;
using helpers.Layer;
using helpers.Artboard;
import exp.Config.Conf;
using helpers.Document;
using Lambda;


typedef ExportData={
  path:String,
  name:String,
  sliced:{slice:Dynamic,bounds:Bounds}
}
typedef Bounds={
  x:Float,
  y:Float,
  relx:Float,
  rely:Float,
  width:Float,
  height:Float

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
  public static function hasBlending(layer:MSLayer):Bool{
      

       var blend:Bool=untyped layer.style().hasBlending();
       //helpers.UI.alert(Std.string(blend));
       
       return blend;
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
  public static function isPage(l:MSLayer):Bool{
    var  klass = l._class();
    return  klass== MSPage;
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
  public static function isSymbol(l:MSLayer):Bool
  {
    return l.parentOrSelfIsSymbol(); 
  }
  
  
	public static function old_export(layer:MSLayer,path:String,factor:Float,config:Conf):ExportData{
   	
   	var invisible:Bool=false;
    var artboard = layer.parentArtboard();
    var page= layer.parentPage();
    var cleanName=layer.name().clean();
    var extension=config.format;
    var file=cleanName+"."+extension;
    
    path = config.imagesPath +page.name()+"/"+artboard.name()+"/"+  file;
    
    if(!layer.hasBlending())
    artboard.hideOtherLayers(layer);
    else
    artboard.hideLayersOnTop(layer);

    if (!layer.isVisible()){
    	invisible=true;
    	layer.setIsVisible(true);
    }
   // path=config.imagesPath+"/"+  layer.name().clean()+ "."+config.format;
   
    factor=config.scale;
    
   	//_trace("here");
    var sliced = layer.withFactor(factor);

    //_trace("here");
    doc.saveArtboardOrSlice(sliced.slice,path);
    //_trace("here");
    if( invisible)layer.setIsVisible(false);
    if(!layer.hasBlending())
    try artboard.showHiddenLayers() catch( msg:Dynamic)_trace(msg);
    else
    artboard.showHiddenOnTop(layer);
   
   	return {path:path,name:file,sliced:sliced};
  	}

    public static function export(layer:MSLayer,path:String,factor:Float,config:Conf):ExportData
    {
    var invisible:Bool=false;
    var artboard = layer.parentArtboard();
    var page= layer.parentPage();
    var cleanName=layer.name().clean();
    var extension=config.format;
    var file=cleanName+"."+extension;
    
    path = path+  file;
    
    //path=path+file;
    // try{
    // if(!layer.hasBlending())
    // artboard.hideOtherLayers(layer);
    //  else
    //  artboard.hideLayersOnTop(layer);
    // }catch(msg:Dynamic){
    //   log("blending wtf");
    // }
    if (!layer.isVisible()){
      invisible=true;
      layer.setIsVisible(true);
    }
   // path=config.imagesPath+"/"+  layer.name().clean()+ "."+config.format;
   
    factor=config.scale;
     
    //_trace("here");
    var sliced = layer.framerExport(path);

    //_trace("here");
   // doc.saveArtboardOrSlice(sliced.slice,path);
    //_trace("here");
    // try{
    // if( invisible)layer.setIsVisible(false);
    // // if(!layer.hasBlending())
    // try artboard.showHiddenLayers() catch( msg:Dynamic)_trace(msg);
    // // else
    // // artboard.showHiddenOnTop(layer);
    // }catch(msg:Dynamic){log("blending again !");}
   
    return {path:path,name:file,sliced:sliced};
    }
  	public static function exportSvg(layer:MSLayer,path:String,config:Conf):ExportData
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
    var cleanName=layer.name().clean();
    
    //_trace( path +"factor="+Std.string(factor));
    
    factor=config.scale;
   	//_trace("here");
    var sliced = layer.withFactor(factor);
   
    //_trace("here");
    
    doc.saveArtboardOrSlice(sliced.slice,path);
    //_trace("here");
     if( invisible)layer.setIsVisible(false);
     try artboard.showHiddenLayers() catch( msg:Dynamic)_trace(msg);
   	return {path:path,name:cleanName,sliced:sliced};
  	}
  	public static function exportFlat(layer:MSLayer,path:String,factor:Float,config:Conf):ExportData{
  	return export(layer,path,factor,config);
  	}

    //should replace withfactor
    public static function framerExport(view:MSLayer,filename:String):{slice:Dynamic,bounds:Bounds}
    {
      var  clone = view.duplicate();
      //var  frame = clone.frame();

      
      // Actual writing of asset
  // TODO: maybe use Exportable Layers?
  //var filename = this.asset_path();
  //var slice = [[MSSliceMaker slicesFromExportableLayer:view inRect:rect] firstObject];
 MSSliceTrimming.safeRectForSlice(clone);
 if( clone.parentOrSelfIsSymbol()&&clone.isGroup()){
      
    untyped clone.setIgnoreNextSymbolSyncChange(true);
    }else{
    MSSliceTrimming.trimSlice(clone);
    }
  
  var rect =clone.absoluteRect().rect();
  var slice = MSSliceMaker.slicesFromExportableLayer(view,rect).firstObject();
  
  //slice.page = [[doc currentPage] copyLightweight];
  log(slice);
  slice.setPage( doc.currentPage().copyLightweight());
  slice.setFormat("png");
  var bounds={x:clone.absoluteRect().rulerX(),
      y:clone.absoluteRect().rulerY(),
      width:clone.frame().width(),
      height:clone.frame().height(),
      relx:clone.frame().x(),
      rely:clone.frame().y()};
try clone.removeFromParent() catch (msg:Dynamic) log(msg);
  
  //var imageData = [MSSliceExporter dataForRequest:slice];
  var imageData = MSSliceExporter.dataForRequest(slice);
 // [imageData writeToFile:filename atomically:true];
  
  

  var good=imageData.writeToFile(filename,true);
  if(!good)helpers.UI.alert("not saved "+filename);
  return {slice:view,bounds:bounds};
    }




   public static function withFactor(layer:MSLayer,factor:Float):{slice:MSSlice,bounds:Bounds}{
    //var layerOrig = this.orig;
    var  copy = layer.duplicate();
    var  frame = copy.frame();
    _trace("here");
    var rect=null;
    //var  rect = [copy rectByAccountingForStyleSize:[[copy absoluteRect] rect]];
    //try  rect = copy.rectByAccountingForStyleSize(copy.absoluteRect().rect()) catch (msg:Dynamic)_trace(msg);
    //_trace("here");
    MSSliceTrimming.safeRectForSlice(copy);
    if( copy.parentOrSelfIsSymbol()&&copy.isGroup()){
     
    untyped copy.setIgnoreNextSymbolSyncChange(true);
    }else{
    MSSliceTrimming.trimSlice(copy);
    }
    //var rect=copy.frame().rect();
    //var rect=copy.absoluteRect().rect() ;
    //var slice = MSSlice.sliceWithRect(rect ,factor);
    var bounds={x:copy.absoluteRect().rulerX(),
      y:copy.absoluteRect().rulerY(),
      width:copy.frame().width(),
      height:copy.frame().height(),
      relx:copy.frame().x(),
      rely:copy.frame().y()}

      
    //var rect=copy.rectByAccountingForStyleSize(copy.absoluteRect().rect()) ;
    var rect=copy.absoluteRect().rect();
    var slice = MSSlice.sliceWithRect(rect ,factor);
    
	   try copy.removeFromParent() catch (msg:Dynamic) log(msg);
    
    
    return {slice:slice,bounds:bounds};
  }
}