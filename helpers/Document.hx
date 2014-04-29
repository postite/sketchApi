package helpers;
import Global.*;
import bs.BomberCommands;
import helpers.Artboard;
@:publicFields
class Document
{
	static function dir(d:MSDocument):String
	{
		return BomberCommands.getFileFolder();
	}
	static function pluginPath(d:MSDocument):String
	{
		return untyped __js__('[[[CHPluginsController alloc] init] fullPluginPath]');
	}

	static function filePath(d:MSDocument):String{
		return d.fileURL().path();
	}

	static function numberOfExportableGroups(d:MSDocument):Int
	{
 	 var number = 0;
 	 for ( arts in d.artboards())
 	 	number+=helpers.Artboard.numberOfExportableGroups(arts);
 	 return number;
	}

	static function createText(d:MSDocument,content:String,_path):Void
	{
		untyped __js__('
 		var someContent = NSString.stringWithString_(content)
		var path = _path
		someContent.dataUsingEncoding_(NSUTF8StringEncoding).writeToFile_atomically_(path, true)
	');

	//untyped content.NSString.writeToFile_atmically_encoding_error(path,YES,NSUTF8StringEncoding,null);
	}
	//move it 
	static function loadTxt(d:MSDocument,file:String):String{
		var fileContent= untyped NSString.stringWithContentsOfFile_encoding_error(file,NSUTF8StringEncoding,null);
  // var settings = untyped __js__('[NSString stringWithContentsOfFile:SETTINGS_FILE
  //                                          encoding:NSUTF8StringEncoding
  //                                             error:nil]');
	
  //settings = JSON.parse(settings) || {}
  //return settings
  	return fileContent;
	}
	static function loadJson(d:MSDocument,file:String):Dynamic
	{
		
		var fileContent=loadTxt(d,file);
		var t= haxe.Json.parse(fileContent);
		//log("loadJson"+t);
		return t;
	}


	//todo
	static function stockInUserData(d:MSDocument, key:String,data:Dynamic){

		// switch Type.typeof(data){
		// 	case Int:
		// 		setInteger...
		// 	case String:
		// 		setString...
		// }
	}
	//todo
	static function getInUserData(d:MSDocument,key:String):Dynamic{
		return null;
	}
	//todo
	static function usersDefaults(d:MSDocument)
	{
		
	}

}