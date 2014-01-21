extern class MSPage extends MSLayerGroup{

//MSPage is a subclass of MSLayerGroup that represents a page of the document. The -frame parameter of an MSPage is not useful as its not guaranteed to contain all layers on the page. Hoever do check out MSLayerGroup as there are useful methods in there as well

public function contentBounds():GKRect;
//If you want a rectangle around everything on the canvas, use this. It returns a GKRect object that you can use to export from. Such as described in Exporting Areas.

public function allSlices():SketchArray<MSSliceLayer>;
//Returns an array of all slices in the document and its enclosing artboards. To get an array of just the artboards on the page itself, use:

public function slices():SketchArray<MSSliceLayer>;
//Returns an array of all slices on the page, not including artboards

public function artboards():SketchArray<MSArtboardGroup>;
//Returns an array of all artboards on the page.

public function duplicate():MSPage;  //SketchBug ? return but doesn't insert
//Duplicates the Page, inserts it just below this page. Returns the new page. Available as of beta 184 / version 2.2.5

public function horizontalRulerData():MSRulerData;
//public var verticalRulerData:Dynamic;
//Both return the MSRulerData object used to store rulers for their respective axes. Note that this data is only used if there's no artboard on the page. MSArtboardGroup has similar methods for itself

// undocumented 
public function currentArtboard():MSArtboardGroup;
public function setCurrentArtboard(art:MSArtboardGroup):Void;
public function name():String;
}