package bs;


class BomberCommands{



  // should use macros for that 
  static public function alert(msg:String, title:String) {
    if (title == null)  title = "Whoops" ;
    //var app = [NSApplication sharedApplication];
    var app = NSApplication.sharedApplication();
    untyped log(app);
    //app.displayDialog_withTitle(msg,title); //not
    app.displayDialog_withTitle(msg,title);
    //untyped __js__("[app displayDialog:msg withTitle:title]");
  }

  //usage bs.BomberCommands.create_folder(getFileFolder()+"paf/");
  static public function create_folder(path:String) {
    //var file_manager = [NSFileManager defaultManager];
    var file_manager = NSFileManager.defaultManager();
   try {file_manager.createDirectoryAtPath(path,true);}
   catch(msg:Dynamic){
   	untyped log("error creating folder"+path +"--" +msg);
   }
    ///[file_manager createDirectoryAtPath:path withIntermediateDirectories:true attributes:nil error:nil];
  }

  static public function getFileFolder():String{
    var file_url = Global.doc.fileURL();
    var file_path = file_url.path();
        //file_folder = file_path.split([doc displayName])[0];
    var file_folder = file_path.split(Global.doc.displayName())[0];
    return file_folder;
  }

  static public function getExportPath(){
    var file_folder = bs.BomberCommands.getFileFolder();
    var export_folder = file_folder +  Global.doc.displayName().split('.sketch')[0] + "_export/";
    return export_folder;
  }

  static public function export_all_slices(format:String,?path:String){
    if (path == null) {
      path = bs.BomberCommands.getExportPath();
    }
    try{
    var pages=Global.doc.pages();
    for ( page in pages){
    	Global.doc.setCurrentPage(page);
    	var slices = Global.doc.currentPage().allSlices();
    	for ( slice in slices )
    		Global.doc.saveArtboardOrSlice( slice , path+slice.name()+"."+format);
    }
    
	}catch(msg:Dynamic){
		untyped log( "err"+msg);
	}
  }

  static public function export_all_artboards(format:String,?path:String):Void{
    	if (path == null) {
    	  path = getExportPath();
    	}
	
		var pages=Global.doc.pages();
    	for ( page in pages){
    		Global.doc.setCurrentPage(page);
    		var pagename= Global.doc.currentPage().name();
    		var artBoards=page.artboards();
    			for ( art in artBoards)
    				Global.doc.saveArtboardOrSlice(art ,path+ "/" + pagename + art.name() +"."+format);
    	}
    }

    //todo
    static public function export_item(item:Dynamic,format:String,path:String):Void{
    // var sel = item;
    // //var rect = [sel rectByAccountingForStyleSize:[[sel absoluteRect] rect]];
    
    // [doc saveArtboardOrSlice:[GKRect rectWithRect:rect] toFile:path + "/" + [sel name] + "." + format];
  }
  //todo 
  static public function export_item_to_desktop(item:Dynamic,format:String):Void{
  //   var desktop = [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) objectAtIndex:0];
  //   com.bomberstudios.export_item(item,format,desktop);
  }

  //todo
  static public function open_finder_in(path):Void {
  	try {
    untyped __js__ ('
    var open_finder =[[NSTask alloc] init];

    var open_finder_args = [NSArray arrayWithObjects:".", nil];

    [open_finder setCurrentDirectoryPath:path];
    [open_finder setLaunchPath:"/usr/bin/open"];
    [open_finder setArguments:open_finder_args];
    [open_finder launch]
    [open_finder release]');
	}catch(msg:Dynamic){
		untyped log("error"+msg);
	}
  }


  //todo
  static public function reveal_finder_in(path:String):Void {
  	 untyped __js__ ('
     var open_finder = [[NSTask alloc] init];
     var open_finder_args = [NSArray arrayWithObjects:"-R", path, nil];

     [open_finder setLaunchPath:"/usr/bin/open"];
     [open_finder setArguments:open_finder_args];
     [open_finder launch]
     [open_finder release]');
  }




}