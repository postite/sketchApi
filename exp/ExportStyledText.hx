package exp;
import Global.*;
import exp.ExportText.TextProperties;
import MSSharedLayerContainer.MSSharedLayerTextStyleContainer;
typedef StyleId=String;
typedef StyleName=String;
class ExportStyledText extends ExportText{
	static var dataContainer:MSSharedLayerTextStyleContainer;
	static var styles:Map<StyleId,StyleName>;
	static var css:Map<StyleName,TextProperties>;
	public function new (origLayer:MSLayer):Void
	{
		init();
		super( cast origLayer);
		this.type=StyledText;
		
	}
	function  init():Void
	{

		if(styles==null){

			styles=new Map();
			css=new Map();
			var datastylesOb=dataContainer.objects();
			log(" initit");
			for ( style in datastylesOb){
				styles.set(style.style().sharedObjectID(),style.name());
				css.set(style.name(),cast {});
			}
			log( "after loop");
			

		}
	}
	public function styleName():String
	{
		return (getStyleName(this.orig.style().sharedObjectID()));
	}
	public function getStyleName(id:StyleId):String
	{
		return styles.get(id);
	}

	override function export():Exportable
	{
		super.export();
		css.set(this.styleName(),this.TP);
		if(cast (this.orig).stringValue()==this.styleName()+"Mock"){
			//helpers.UI.alert("Mock");
			 doc.documentData().layerTextStyles().removeSharedStyle(dataContainer.sharedStyleWithID(this.orig.style().sharedObjectID()));	
			this.orig.removeFromParent();
			this.type=Mock;
			return this;
		}
		
		
		return this;
	}
	public static function generateCss():String
	{
		log("genarate css");
		var cssString="";
		if( css!=null){
		for (style in css.keys()){
			
		var texteProps=css.get(style);
		//var lineHeight=(this.height>= texteProps.lineSpacing*1.5)? texteProps.lineSpacing : node.height;
		var css='font-size:${texteProps.fontSize}px;\n';
		css+='font-family:"${texteProps.fontPostscriptName}";\n';
		css+='text-align:${texteProps.textAlignment};\n';
		css+='line-height:${texteProps.lineSpacing}px;\n';
		css+='color:#${texteProps.color};\n';
								
		cssString+='.$style{\n$css\n}\n';
			
		}
		}
		return cssString;

	}

	// hack because setTextSyles does not register in menu. 
	public static function createMocks():Void
	{
		
		dataContainer=cast doc.documentData().layerTextStyles();
		var datastyles:SketchArray<Dynamic>=dataContainer.objects();
		//using a clone to avoid recursive loop
		var clone=datastyles.iterator().haxeArray();

			for ( style in clone){
				log(style);
				// log( datastyles.indexOfSharedStyle(style));
				
				var text:MSTextLayer=untyped selection.firstObject().addLayerOfType("text");
				text.setStringValue(style.name()+"Mock");
				
				//log( datastyles.registerInstance_withSharedStyle(untyped text.sharedObjectID(),style));
				 untyped text.style().setTextStyle(style.style().textStyle());
				var newStyle=  dataContainer.addSharedStyleWithName(style.name(),text.style());
				

			}


	}
}