package exp;
import Global.*;
typedef TextProperties={
	text:String,
	color:String,
	fontSize:Int,
	fontPostscriptName:String,
	textAlignment:Dynamic,
	characterSpacing:Int,
	lineSpacing:Float,
	alpha:Float,
	toObj:Void->Dynamic
}
// switch to enum Abstract ?
enum Alignement{
	WTF;
	Right;//1
	Center; //2
	Justify; //3
	Left; //4

}
class ExportText extends ExportContainer implements Exportable
{

	public var TP:TextProperties;
	public function new(layer:MSTextLayer)
	{
		_trace( "hello text");
		super(cast layer);
		this.type=Text;
		//name=name+'____text';

			
		
	}
	override public function export():Exportable{
		//super.export();
		var layer:MSTextLayer =cast orig;
		TP= cast {};
		_trace( "textVAlue"+layer.stringValue());
			TP.text=splitP(layer.stringValue());
			//TP.text=layer.stringValue();
			
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
		
		_trace(" font stuff");
		 
		// not clean metrics ! 
		return super.export();
	} 
	

	public function toObject()
	{
		//return {slip:"popo"};
		return {
			
			content:TP.text.toString(),
			textColor:TP.color.toString(),
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
		_trace("Align="+code);
		//return "left";
		return Type.createEnumIndex(Alignement,code).getName();
	}

	function splitP(text:String):String{
		var z:String="";
		//var t=~/\n/gm.map(text,function(r){return "</p><p>";});
		
		if(~/\n/g.match(text)){
		var t=~/\n\n/g.replace(text,"</p><p>");
		var z=~/\n/g.replace(t,"<br/>");
		z="<p>"+z+"</p>";
		return z;
		}
		return text;
	}
}