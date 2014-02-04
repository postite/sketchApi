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
	origine:Origin,
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


//undocumented
public function  rectWithRect(d:Dynamic):Dynamic;  /// ? //todo
public function rect():NSRect; /// not sure
public function  expandBy(v:Float):Void; //untested //in MSRect too ?
public function  insetBy(v:Float):Void; //untested //in MSRect too ?
public function  insetXBy(px:Float):Void; //untested //in MSRect too ?
public function  insetYBy(px:Float):Void; //untested //in MSRect too ?

public inline function toString():String{
	return Std.string(RecTools.getBounds(this));
}

}