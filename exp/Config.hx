package exp;
import Global.*;
using helpers.Document;
using helpers.UI;
using StringTools;
@:publicFields



typedef Conf={

	 imagesPath:String,
	 imagesPathOut:String,
	 modelPath:String,
	 scale:Float,
	 forceConfig:Bool,
	 forceSlices:Bool,
	 allArtBoards:Bool,
	 allPages:Bool,
	 cleanUp:Bool,
	 format:String

}

class Config


{
	@:iVar public var page(get, never):String;
	@:keep function get_page():String { return doc.currentPage().name(); }
	 @:iVar public var art(get, never):String;
	@:keep function get_art():String { return doc.currentPage().currentArtboard().name(); }
	@:iVar public var dir(get, never):String;
	@:keep function get_dir():String { return doc.dir();}

	public static var SETTINGNAME="/settings_test_";
	// function set_pop(value:String):String
	// {
	// 	return pop = value;
	// }
	public static var defaults:Conf={
		imagesPath:"$dir/view/$page/$art/images/",
		imagesPathOut:"images/",
		modelPath:"$dir/view/$page/$art/",
	 	scale:1,
	 	format:"png",
	 	forceConfig:true,
	 	allArtBoards:false,
	 	allPages:false,
	 	cleanUp:false,
	 	forceSlices:false
	 }
	public var data:Conf=cast {};
	public function new(){
	
	
	}
	public function check():Void
	{
		
		var settings:Conf=doc.loadJson(doc.dir()+SETTINGNAME+doc.displayName()+".json");
		if(settings!=null){
		//'no settings'.alert("pas cool");
		data=settings;
		data.imagesPath=parse(data.imagesPath);
		data.imagesPathOut=parse(data.imagesPathOut);
		data.modelPath=parse(data.modelPath);
		
		}else{
		create();
		}
	}

	// /drawable(@dpi)/nomArtboard_image_comportement(bouton?)_state_
	public function pathPattern(str:String):String
	{

		
		return str;

	}
	function parse(s:String):String
	{
		var n=[];
		var p=s.split("/");
		var fill="error";
		var f=s;
		for (a in p){
			//var m=a.toString();
			if (a.indexOf("$")!=-1){
			var w=a.substr(1);
			

			try{
			 fill=Reflect.getProperty(this,w);
			
			if(fill==null)throw "pas de prop pour $" +w;
			f=StringTools.replace(f,a,fill);
			}catch(msg:Dynamic){helpers.UI.alert('Config'+msg);}
			}else{
			
			}
			
			_trace( f);
		}
		return f;
	}

	public function create():Void
	{
		//	doc.loadTxt("ppo");
		var settings=haxe.Json.stringify(defaults," ");

		//settings=haxe.format.JsonPrinter.print(defaults);
	doc.createText(settings,doc.dir()+SETTINGNAME+doc.displayName()+".json");
		//doc.askForUserInput("hello",0,"pitatatatatatattatata\niudiuiduisqudiusidu\nhsjhdjhsjdhq");
	"settings created in dir".alert("cool");
	check();
	}
		static public function main()
	  {
			var app = new Config();
		}
	
}