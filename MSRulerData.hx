extern class MSRulerData{


//Stores the guides used on its ruler. MSPage and MSArtboardGroup both return their ruler data using -horizontalRulerData and -verticalRulerData

public function addGuideWithValue(v:Int):Dynamic;
//Supply an integer value (measured from the origin of the ruler). Adds a new guide at the given value

public function numberOfGuides():Int;
//Returns the number of guides on this ruler

public function guideAtIndex(index:Int):Int;
//Returns the integer value of the given guide. The argument is a zero-based index value.

public function removeGuideAtIndex(index:Int):Void;
//Remove the guide at the given index.
}