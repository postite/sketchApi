package exp;
class ExportLayer implements Exportable{

	public var orig(default,null):MSLayer;
	public var name:String;
	public var x(default,null):Float;
	public var y(default,null):Float;
	public var src:String;
	public function new(layer:MSLayerGroup){
		orig= layer;
		name=layer.name()+"export";
		x=layer.frame().x();
		y=layer.frame().y();
		src="plk";
		
	}
}