package helpers;
using helpers.Layer;
import Global.*;
using Lambda;
import exp.Exportable;
class Artboard{

  private static var hiddenLayers:Map<Int,List<MSLayer>>= new Map();


  /// compte le nombre de layer exportables.
 public static function numberOfExportableGroups(a:MSArtboardGroup):Int{
 		   var number = 0;
      	for( layer in a.layers())
      		if (layer.isExportable())number++;
    	
      	
      	return number;
   
 }

  //filtre et retourne les groupes dans l'artboard
 public static function groups(a:MSArtboardGroup):Array<Exportable>{
  log( "groups");
 var hxLayers= a.layers().iterator().haxeArray();
 var grouped:List<MSLayerGroup>= cast  Lambda.filter(hxLayers,function(layer:MSLayer){
 		return layer.isGroup();
 	});
 log( "grouped="+grouped);
  var exportables=grouped.map(genExportable).array();
  log( "exportables"+exportables);
  return exportables;
	}


  //génere ExportableLayers
  private static function genExportable(layerGroup:MSLayerGroup):Exportable{
    log("genExportable");
    return exp.ExportFactory.create(layerGroup);
    
  }




  //cache les autres layers
	public static function hideOtherLayers(a:MSArtboardGroup,currentLayer:MSLayer)
	{
   
	
		for ( layer in a.layers()){
			
			if (currentLayer!=layer) 
				if (layer.isVisible) try untyped(layer).isVisible=false catch(err:Dynamic)_trace( err);
			
      setHiddenLayers(a,layer);
		}
    
	}
  
  private  static function showHiddenLayers(a:MSArtboardGroup){
     for (hidden in getHiddenLayers(a)){
        hidden.isVisible=true;
     }
  }



////// convenient getset vt hiddenlayers

  private  static function getHiddenLayers(a:MSArtboardGroup):List<MSLayer>
  {  
    return hiddenLayers.get(a.hash());
  }
  private  static function setHiddenLayers(a:MSArtboardGroup,hiddenLayer:MSLayer)
  {
   if( getHiddenLayers(a)==null)hiddenLayers.set(a.hash(),new List());

   var liste=null;
   if(hiddenLayers.get(a.hash()) !=null)
   liste=hiddenLayers.get(a.hash());
   else liste= new List();
   liste.add(hiddenLayer);
   hiddenLayers.set(a.hash(),liste);
  }
	
}