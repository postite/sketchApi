

typedef Bounds={
	x:Float,
	y:Float,
	width:Float,
	height:Float
}
class RecTools{

	public static function getBounds(rect:GKRect):Bounds{
		return untyped {x:rect.x(),y:rect.y(),width:rect.width(),height:rect.height()};
	}
}