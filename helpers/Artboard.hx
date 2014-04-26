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
  _trace( "groups");
 var hxLayers= a.layers().iterator().haxeArray();
 var grouped:List<MSLayerGroup>= cast  Lambda.filter(hxLayers,function(layer:MSLayer){
 		return layer.isGroup();
 	});
 _trace( "grouped="+grouped);
  var exportables=grouped.map(genExportable).array();
  _trace( "exportables"+exportables);
  return exportables;
	}


  //génere ExportableLayers
  private static function genExportable(layerGroup:MSLayerGroup):Exportable{
    _trace("genExportable");

    return exp.ExportFactory.create(layerGroup);
    
  }




  //cache les autres layers
	public static function hideOtherLayers(a:MSArtboardGroup,currentLayer:MSLayer,withChilds:Bool=true)
	{
   
	 var parents:Array<MSLayer>=[];
   var node:MSLayer=currentLayer.parentGroup();
   while (node!=a){
        if( node.isVisible())
        parents.push(node);
        node= node.parentGroup();
      }
		for ( layer in a.layers()){
			if (currentLayer!=layer ){
          var layerParent=layer.parentGroup();
          //avec les enfants ( flat or Not)
          if(withChilds){
				      if ( layer.isVisible()){
                _trace("________visible________"+layerParent.name()+"currentLayer"+layer.name() +"visible="+layer.isVisible());
                 try{ 
                  untyped(layer).setIsVisible(false);
                  setHiddenLayers(a,layer);
                 } catch(err:Dynamic){
                  _trace("________________________"+ err);
                }
              
              }
          }else{
            
          }
      }
		}
     for (p in parents){ 
      try p.setIsVisible(true) catch(err:Dynamic)_trace( err);
    //       // unsetHiddenLayers
        }
    parents=null;
	}
  
  private  static function showHiddenLayers(a:MSArtboardGroup){
     for (hidden in getHiddenLayers(a)){
        hidden.setIsVisible(true);
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