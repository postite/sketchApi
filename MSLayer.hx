extern class MSLayer{

//MSLayer is the base class that represents a layer object. The main attributes are:
	public function new()
	{
		
	}

//An instance of MSRect. Determines size and position on the canvas
public function frame():MSRect;

//An instance of MSStyle. Determines all style-related attributes such as Borders, Fills, Shadows and more
public function style():MSStyle;
// function get_style()return style;

//The name of the layer as it appears in the layer list. An NSString
public function name():String; // not a realString ? doesnt work well with subfr for ex:
public function setName(name:String):Void;

//Returns true if the layer is visible - that is, not hidden
public function isVisible():Bool;
public function setisVisible(t:Bool):Void;

//Returns true if the user locked the layer
public function isLocked():Bool;
public function setIsLocked(t:Bool):Void;

public function rotation():Int;
public function setRotation(deg:Int):Void;
//An integer denoting the rotation of the layer - in degrees. Rotation happens counter-clockwise
public function isFlippedHorizontal():Bool;
public function setIsFlippedHorizontal(t:Bool):Void;
public function isFlippedVertical():Bool;
public function setIsFlippedVertical(t:Bool):Void;
//Flips the layer horizontal or vertical

public function parentGroup():Dynamic; //todo
//Returns the parent group of this layer. Note that this can return an MSPage or MSArtboardGroup as well
public function isSelected():Bool;
public function setIsSelected(t:Bool):Void;
//True if the layer is selected.
public function absoluteRect():GKRect;
//Returns a GKRect object that returns the bounds of this layer in absolute coordinates; it takes into account the layer's rotation and that of any of its parents.

public function duplicate():MSLayer;
//Duplicates the layer and insert the copy above itself


//undocumented 
public function layers():SketchArray<MSLayer>;

/*
// not working
public function setFixedRadius(r:Int):Void;
public function fixedRadius():Int;
*/





public function isMemberOfClass(c:Class<Dynamic>):Bool;


}