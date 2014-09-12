import Global.*;
class TestLayer extends haxe.unit.TestCase{

	public static var activeLayer:MSLayer;
	override public function setup():Void
    {
    	
    }

    function testProperties():Void
    {
    	var group=createRectangle(createGroup());
    	doc.currentPage().addLayer(group);
    	group.frame().setX(100);
    	this.assertEquals(activeLayer.x1(),400);
    	this.assertEquals(activeLayer.x1(),activeLayer.absoluteRect().rulerX());
    	this.assertEquals(activeLayer.x2(),activeLayer.x1()+activeLayer.frame().width());
    	group.removeFromParent();
    	
    }


    function testSelect():Void
    {
    	var group=createRectangle(createGroup());
    	doc.currentPage().addLayer(group);
    	activeLayer.select(true,false);
    	this.assertEquals(selection.firstObject(),activeLayer);

    	
    }
    override public function tearDown():Void
    {

    	//activeLayer.removeFromParent();
    }

    public static function createGroup():MSLayerGroup{
    	var group=MSLayerGroup.create();
    	//doc.currentPage().addLayer(group);
    	return group;
    }
    public static function createRectangle(inside:MSLayerGroup):MSLayerGroup
    {
    	
    	activeLayer=inside.addLayerOfType("rectangle");
    	activeLayer.frame().setWidth(502);
		activeLayer.frame().setHeight(201);
		activeLayer.frame().setX(300);
		activeLayer.setName("testRectangleLayer");
		untyped activeLayer.style().fills().addNewStylePart();
		var fill=activeLayer.style().fills().firstObject();
		var color=MSColor.colorWithHex("#cc3300",1);
		
		fill.setColor(color);
		return inside;
		
    }
}