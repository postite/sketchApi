package exp;
import Global.*;
typedef TextProperties={
	text:String,
	color:String,
	fontSize:Int,
	fontPostscriptName:String,
	textAlignment:Dynamic,
	characterSpacing:Int,
	lineSpacing:Int,
	alpha:Float,
	toObj:Void->Dynamic
}

enum Alignement{
	Left; //0
	Right;//1
	Center; //2
	Justify; //3
}
class ExportText extends ExportLayer implements Exportable
{

	var TP:TextProperties;
	public function new(layer:MSTextLayer)
	{
		_trace( "hello text");
		super(cast layer);
		name=name+'____text';
			TP= cast {};
			TP.text=layer.stringValue();
			TP.color=layer.style().fills().firstObject().color().hexValue();
			TP.fontSize=layer.fontSize();
 			TP.fontPostscriptName=""+layer.fontPostscriptName();
 			// textColor={
 			//  r=Math.round(layer.textColor().red()*255);
 			//  b=Math.round(layer.textColor().blue()*255);
 			//  g=Math.round(layer.textColor().green()*255)
 			//  };
 			
      		//alpha=layer.textColor().alpha().toFixed(1);
      		TP.alpha=layer.style().fills().firstObject().color().alpha();
      		TP.textAlignment=Align(layer.textAlignment());
      		TP.characterSpacing=layer.characterSpacing();
      		TP.lineSpacing=layer.lineSpacing();
      		TP.toObj=toObject;
		text=TP;
	}

	function toObject()
	{
		//return {slip:"popo"};
		return {
			text:TP.text.toString(),
			color:TP.color.toString(),
			fontSize:TP.fontSize,
			fontPostscriptName:TP.fontPostscriptName,
			textAlignment:TP.textAlignment,
			characterSpacing:TP.characterSpacing,
			lineSpacing:TP.lineSpacing,
			alpha:normalize(TP.alpha)
			
		}
	}

	function Align(code:Int):String
	{
		return Type.createEnumIndex(Alignement,code).getName();
	}
}