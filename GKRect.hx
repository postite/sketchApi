typedef CGSize={
	width:Float,
	height:Float
}
typedef Origin=CGPoint

typedef CGPoint={
     x:Float,
     y:Float
}
typedef CGRect=NSRect

typedef NSRect={
	size:CGSize,
	origin:Origin,
}
extern class GKRect{

public function size():CGSize;
public function origin():Origin;
public function x():Float; //=origin.x
public function y():Float; //=origin.y
public function width():Float;
public function height():Float;
public function rulerX():Float; 
public function rulerY():Float;

public function setSize(value:CGSize):Void;
public function setOrigin(value:Origin):Void;
public function setX(value:Float):Void; //=origin.x
public function setY(value:Float):Void; //=origin.y
public function setWidth(value:Float):Void;
public function setHeight(value:Float):Void;
public function setRulerX(value:Float):Void; 
public function setRulerY(value:Float):Void;


//undocumented
public function  rectWithRect(d:Dynamic):Dynamic;  /// ? //todo
public function  rect():NSRect; /// not sure
public function  expandBy(v:Float):Void; //untested //in MSRect too ?
public function  insetBy(v:Float):Void; //untested //in MSRect too ?
public function  insetXBy(px:Float):Void; //untested //in MSRect too ?
public function  insetYBy(px:Float):Void; //untested //in MSRect too ?

public inline function toString():String{
	return Std.string(RecTools.getBounds(this));
}

}