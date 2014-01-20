extern class MSContentDrawView {
//This object is canvas view. You can get to it via -currentView on MSDocument. Many of the standard Cocoa actions work here as expected such as

public function cut():Void;
 public function copy():Void;
public function paste():Void;

//Each of these take argument that is not used further, so just supply nil

public function zoomIn():Void;
public function zoomOut():Void;
//Zooms in by 2x or out by the same amount. Again, supply a nil argument

public function actualSize():Void;
//Zooms back to 100%. Provide a nil argument

public function centerRect(rect:GKRect):Void; //take a relative 
//Centers an arbitrary rectangle in the canvas.
// The Argument is expected to be a GKRect. Note that MSRect provides an easy way to get a GKRect as well as does absoluteRect() 
//on MSLayer

public function zoomToFitRect(rect:GKRect):Void; // take an absoluteRect

//Zooms the canvas in or out and scrolls to fit supplied GKRect argument in the view.

}