package helpers;
using helpers.Layer;
import Global.*;
using Lambda;
import exp.Exportable;
import exp.Behave;
import haxe.EnumFlags;
class Artboard{

public static var one:Bool=false;
public static var toggleincludeinExport:Bool=false; 
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
   onelog( "------------hideOthers-----------for "+currentLayer.name());
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
               // _trace("________visible________"+layerParent.name()+"currentLayer"+layer.name() +"visible="+layer.isVisible());
                 try{ 
                  untyped(layer).setIsVisible(false);
                  setHiddenLayers(a,layer);
                 } catch(err:Dynamic){
                  //_trace("________________________"+ err);
                }
              
              }
          }else{
            
          }
      }
		}

    hideSiblings(a,currentLayer,currentLayer,withChilds);


     for (p in parents){ 

      try p.setIsVisible(true) catch(err:Dynamic)_trace( err);
    //       // unsetHiddenLayers
        }

        
      

    parents=null;
	}

  //for blending at start
  //not finished (doesn't work for bitmap in groups).//TODO
  public static function hideLayersOnTop(a:MSArtboardGroup,currentLayer:MSLayer):Void{


      var founded:Bool=false;
       for ( l in a.layers()){
            
            if(l==currentLayer)founded=true;
            if(founded){
            _trace(l.name()+"is ignored");
            try l.setIsVisible(false) catch(msg:Dynamic)_trace("novis"+msg);
            }else{
              _trace(l.name()+"is going to be shown");
            }
            
          }
          a.setIncludeBackgroundColorInExport(true);
          toggleincludeinExport=true;
       
  }
  public static function showHiddenOnTop(a:MSArtboardGroup,currentLayer:MSLayer):Void{
      if(toggleincludeinExport){
        a.setIncludeBackgroundColorInExport(false);
        toggleincludeinExport=false;
      }
  }
  private static function hideParentsSiblings(a:MSArtboardGroup,currentLayer:MSLayer,origLayer:MSLayer,withChilds:Bool):Void
  {

    var active:MSLayer= currentLayer.parentGroup();
    while (active.parentGroup()!=a){

      hideSiblings(a,active,origLayer,withChilds);
      active=active.parentGroup();
    }
  }
  private  static function hideSiblings(a:MSArtboardGroup,currentLayer:MSLayer,origLayer:MSLayer,withChilds:Bool){
     
      /// hide siblings but make it recursive
     // _trace("1234"+ currentLayer.parentGroup().name());
      for ( child in currentLayer.parentGroup().layers()){
       // _trace("_1234 childname"+ child.name());
            if( child!=currentLayer){
           onelog("hide"+ child.name());
            if(child.isVisible())
            hideParentsSiblings(a,child,origLayer,withChilds);
            setHiddenLayers(a,child);
            untyped(child).setIsVisible(false);
            }
          }
     
  }
  
  private  static function showHiddenLayers(a:MSArtboardGroup){
    onelog("--------------show---------------");
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