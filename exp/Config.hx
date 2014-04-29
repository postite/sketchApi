package exp;
import Global.*;
using helpers.Document;
using helpers.UI;

@:publicFields



typedef Conf={

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
	
	public  static var defaults:Conf={
	 	scale:3,
	 	format:"png",
	 	forceConfig:true,
	 	allArtBoards:true,
	 	allPages:true,
	 	cleanUp:true,
	 	forceSlices:false
	 }
	public var data:Conf;
	public function new(){
	_trace( "yo");
	
	}
	public function check():Void
	{
		_trace( "check");
		var settings:Conf=doc.loadJson(doc.dir()+"/pop.json");
		if(settings!=null){
		'settings OK'.alert("cool");
		data=settings;
		}else{
		create();
		}
	}

	public function create():Void
	{
		//	doc.loadTxt("ppo");
		var settings=haxe.Json.stringify(defaults);

		//settings=haxe.format.JsonPrinter.print(defaults);
	doc.createText(settings,doc.dir()+"/pop.json");
		//doc.askForUserInput("hello",0,"pitatatatatatattatata\niudiuiduisqudiusidu\nhsjhdjhsjdhq");
	"settings created in dir".alert("cool");
	check();
	}
		static public function main()
	  {
			var app = new Config();
		}
	
}