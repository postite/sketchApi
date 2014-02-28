package helpers;
using helpers.Layer;
import Global.*;
using Lambda;
import exp.Exportable;
import exp.Behave;
import haxe.EnumFlags;
class Artboard{

  private static var hiddenLayers:Map<Int,List<MSLayer>>= new Map();
  //private static var beaviours:Map<Int,EnumFlags<Behave>>=new Map();

  /// compte le nombre de layer exportables.
 public static function numberOfExportableGroups(a:MSArtboardGroup):Int{
 		   var number = 0;
      	for( layer in a.layers())
      		if (layer.isExportable())number++;
      	return number;
   
 }
 public static function isGroup(a:MSArtboardGroup):Bool
 {
   return true;
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
	public static function hideOtherLayers(a:MSArtboardGroup,currentLayer:MSLayer,withChilds:Bool=true)
	{
   
	 var parents:Array<MSLayer>=[];
   var node:MSLayer=currentLayer.parentGroup();
   while (node!=a){
        parents.push(node);
        node= node.parentGroup();
      }
		for ( layer in a.layers()){
			if (currentLayer!=layer )

          //avec les enfants ( flat or Not)
          if(withChilds){
				if (layer.isVisible) try untyped(layer).isVisible=false catch(err:Dynamic)_trace( err);
        setHiddenLayers(a,layer);
          }else{
            
          }
      
		}
    for (p in parents){ try untyped(p).isVisible=true catch(err:Dynamic)_trace( err);
          // unsetHiddenLayers
        }
    parents=null;
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