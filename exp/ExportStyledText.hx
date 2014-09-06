package exp;
import Global.*;
import exp.ExportText.TextProperties;

typedef StyleId=String;
typedef StyleName=String;
class ExportStyledText extends ExportText{

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
			var datastyles=doc.documentData().layerTextStyles().objects();
			for ( style in datastyles){
				styles.set(style.style().sharedObjectID(),style.name());

			}
			log( styles);
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
		
		return this;
	}
	public static function generateCss():String
	{

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
}