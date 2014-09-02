package exp;
import Global.*;
using helpers.Document;
using helpers.UI;
using StringTools;
@:publicFields



typedef Conf={

	 imagesPath:String,
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
	
	public static var defaults:Conf={
		imagesPath:"/view/images",
	 	scale:1,
	 	format:"png",
	 	forceConfig:true,
	 	allArtBoards:false,
	 	allPages:false,
	 	cleanUp:false,
	 	forceSlices:false
	 }
	public var data:Conf;
	public function new(){
	_trace( "yo");
	
	}
	public function check():Void
	{
		_trace( "check");
		var settings:Conf=doc.loadJson(doc.dir()+"/settings_"+doc.displayName()+".json");
		if(settings!=null){
		//'no settings'.alert("pas cool");
		data=settings;
		}else{
		create();
		}
	}

	// /drawable(@dpi)/nomArtboard_image_comportement(bouton?)_state_
	public function pathPattern(str:String):String
	{

		
		return str;

	}

	public function create():Void
	{
		//	doc.loadTxt("ppo");
		var settings=haxe.Json.stringify(defaults);

		//settings=haxe.format.JsonPrinter.print(defaults);
	doc.createText(settings,doc.dir()+"/settings_"+doc.displayName()+".json");
		//doc.askForUserInput("hello",0,"pitatatatatatattatata\niudiuiduisqudiusidu\nhsjhdjhsjdhq");
	"settings created in dir".alert("cool");
	check();
	}
		static public function main()
	  {
			var app = new Config();
		}
	
}