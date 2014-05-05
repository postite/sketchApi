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
	
	Right;//1
	Center; //2
	Justify; //3
	Left; //4

}
class ExportText extends ExportLayer implements Exportable
{

	var TP:TextProperties;
	public function new(layer:MSTextLayer)
	{
		_trace( "hello text");
		super(cast layer);
		name=name+'____text';

			
		
	}
	override public function export():Exportable{
		var layer:MSTextLayer =cast orig;
		TP= cast {};
			TP.text=layer.stringValue();
			_trace( "textVAlue"+layer.stringValue());
			TP.fontSize=layer.fontSize();
 			TP.fontPostscriptName=""+layer.fontPostscriptName();
 			// textColor={
 			//  r=Math.round(layer.textColor().red()*255);
 			//  b=Math.round(layer.textColor().blue()*255);
 			//  g=Math.round(layer.textColor().green()*255)
 			//  };
 			_trace("pif");
 			try{
 				//if text has layer fill over textProperties 
 				// there is a bug when fill exists but not checked > fill override native textColor
 			_trace("try" );
 			TP.color=layer.style().fills().firstObject().color().hexValue();
 			TP.alpha=layer.style().fills().firstObject().color().alpha();
      		}
      		catch(msg:Dynamic){
      			TP.color=layer.textColor().hexValue();
      			TP.alpha=layer.textColor().alpha();
      			//no style applied 
      			
      		}
      		try{
      		 TP.textAlignment=Align(layer.textAlignment());
      		 TP.characterSpacing=layer.characterSpacing();
      		 TP.lineSpacing=layer.lineSpacing();
      		 TP.toObj=toObject;
			text=TP;
		untyped log(layer.font());
		}
		catch( msg:Dynamic){
			_trace( "font problem"+msg);
		}
		this.type=Text;
		_trace(" font stuff");
		return super.export();
	} 
	

	public function toObject()
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
		//_trace("Align="+code);

		return Type.createEnumIndex(Alignement,code).getName();
	}
}