	class BigCopyPlug
	{

	static public function main()
	{
		var args:Array<String>=Sys.args();
		trace( args);

		
			var json:Array<Dynamic> =haxe.Json.parse(args[0]);
		
		
		for (arg in json){
			trace( '${arg.dir}out/${arg.name}');
		var t = sys.io.File.getContent( '${arg.dir}out/${arg.name}' );
		var f= new StringBuf();
		f.add('// ${arg.name} (${arg.key}) \n');

		//hack for escaped quotes 
		//need a regexp for that
		t=StringTools.replace(t,'"\\""',"'\"'"); //  "\""
		t=StringTools.replace(t,'"=\\""',"'=\"'");  // "=\""
		t=StringTools.replace(t,' \\""',' "');   // \"
		
		
		f.add(t);
		trace( '${arg.dir}out/${arg.name}');
		sys.io.File.saveContent('${arg.dir}out/${arg.name}' ,f.toString());
		//sys.io.File.saveContent('/Users/mavPostite/Library/Containers/com.bohemiancoding.sketch3/Data/Library/Application Support/com.bohemiancoding.sketch3/Plugins/${arg.dir}${arg.name}' ,f.toString());
		trace( 'copied in /Users/mavPostite/Library/Application Support/com.bohemiancoding.sketch3/Plugins/${arg.dir}${arg.name}');
		sys.io.File.saveContent('/Users/mavPostite/Library/Application Support/com.bohemiancoding.sketch3/Plugins/${arg.dir}${arg.name}' ,f.toString());
		//sys.io.File.copy("./out/testApi.jstalk", "/Users/ut/Library/Application Support/sketch/Plugins/TestApi/testApi.jstalk" );
		}
		
	}

}