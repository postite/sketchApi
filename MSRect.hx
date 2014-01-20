extern class MSRect{

//Represents a size and position of a layer on the screen. See MSLayer for more information

public function x(?v:Float):Float; 
public function  y():Float;
public function  width():Float;
public function  height():Float;
//Base attributes. All floats;

public function  addX(n:Float):Void;
public function  addY(n:Float):Void;
public function  addWidth(n:Float):Void;
public function  addHeight(n:Float):Void;
public function  subtractX(n:Float):Void;
public function  subtractY(n:Float):Void;
public function  subtractWidth(n:Float):Void;
public function  subtractHeight(n:Float):Void;
//Adding to any of the base attributes;

//public var midX:Float;
public function  midX():Float;
public function  maxX():Float;
public function  minY():Float;
public function  midY():Float;
public function  maxY():Float;
//All point structures, representing a corner each

//public function  contractBy(px:Float):Dynamic; //// error not a function officially removed from sketchApi
public function  expandBy(px:Float):Dynamic; 
public function  scaleBy(scale:Float):Dynamic;
//Make the rectangle smaller or layer by adding to each side, or scale the rectangle. A scale of 1 is 100%, 0.5 is 50%, etc.

public function  constrainProportions():Bool; //?
public function  calculateProportions():Void; // Todo ?
public function  proportions():Float; //ratio 0->1
//Keeps the width and height proportionally the same. the public function constrainProportions() returns a boolean. public function proportions() returns a float and calculateProportions does exactly what it says on the tin.

public function  GKRect():GKRect;
//Returns a GKRect representation of the rectangle



//undocumented 
public function setRect(rect:GKRect):Void;
public function left():Int;
public function setLeft(px:Int):Void;
public function setTop(px:Int):Void;
public function top():Int;


//perso
public inline function toString():String{
	
	return 'x:$x(),y:$y(),width:$width(),height:$height()';
}
}


