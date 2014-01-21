




extern class MSDocument{

public function setZoomValue(v:Float):Dynamic;
//Zoom the document. 1.0 represents actual size, 2.0 means 200% etc.

public function export():Dynamic;
//Takes you to the the export tool. Pass nil as the argument

public function exportPDFBook():Dynamic;
//A nice method not exposed in the UI at the moment:Dynamic; exports each slice on each page to a multi-page PDF file. Pass nil as the argument

public function showMessage():Dynamic;
//Pas a string to be displayed at the top of the canvas momentarily. The same method used for displaying the current zoom level and other tips.

public function artboards():SketchArray<MSArtboardGroup>;
public function slices():SketchArray<MSSliceLayer>;
//Both return an array representing the artboards and slices on the current page. Artboards are of type MSArtboardGroup and slices are of MSSliceLayer type

public function pages():SketchArray<MSPage>;
//Returns an array of all pages in the document. Each page is an MSPage object





//type: 0:String, 1:combo<Int> 2:explorer 
public inline function askForUserInput(msg:String,?ofType:Int=0,?initialValue:Dynamic):Dynamic{
	return untyped doc.askForUserInput_ofType_initialValue(msg,ofType,initialValue);
} //TODo no comprendo !

//Asks for user input and returns the value they chosen. The first argument is the label for the dialog panel, the second argument can be used to provide a default value. See User Input Examples for an example.
@:overload(function(bounds:MSSliceLayer,path:String):Dynamic{})
@:overload(function(bounds:MSArtboardGroup,path:String):Dynamic{})
public inline function saveArtboardOrSlice(bounds:GKRect,path:String):Void{
	untyped this.saveArtboardOrSlice_toFile(bounds,path);
}
//Saves an area of the canvas to an image file. The first argument is a GKRect, MSSliceLayer or MSArtboardGroup and the image gets written to the file specified in the second argument. The file format is derived from the extension. See Exporting Areas for an example

public function  currentView():MSContentDrawView;
//Returns an MSContentDrawView subclass that represents the visible Canvas.

public function addBlankPage(p:MSPage):Void;
//Adds a new MSPage object to the document, inserting it below the current page, copying its grid and ruler position too. Available as of beta 184 / version 2.2.5

public function removePage(p:MSPage):Void;
//Removes the given page from the document. The argument is an MSPage object. Available as of beta 184 / version 2.2.5

//out of official api
//undocumented
public  function fileURL():MSDocument.SketchFile;
public function saveDocument(t:Dynamic):Void; /// don't know which param
public function displayName():String;
public function setCurrentPage(p:MSPage):Void;
public function currentPage():MSPage;

}
// surely some other properties //todo
extern class SketchFile{
	public function path():String;
}