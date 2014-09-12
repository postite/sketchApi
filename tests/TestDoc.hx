import Global.*;
class TestDoc extends haxe.unit.TestCase {
    
    override public function setup():Void
    {
    	
    }
    public function testDisplayName(){
        assertEquals( doc.displayName(),"testbaz");
           
	    }
	public function testFileURL():Void
	{
		//var firstWordPath=doc.fileURL().path().split("/")[1];
		//var firstWordabs=doc.fileURL().absoluteString().split("/")[0];
		
		
		// var firstWordURL=untyped doc.fileURL().split("/")[1];
    	assertEquals(doc.fileURL().path(),"/Users/mavPostite/Documents/LAB/sketchApi/tests/testbaz.sketch");
    	assertEquals(doc.fileURL().absoluteString(),"file:///Users/mavPostite/Documents/LAB/sketchApi/tests/testbaz.sketch");
    	this.assertEquals(doc.fileURL().pathExtension(),"sketch");
    	this.assertEquals(doc.fileURL().pathComponents()[0],"/");
    	this.assertEquals(doc.fileURL().pathComponents()[1],"Users");
    	this.assertEquals(doc.fileURL().lastPathComponent(),"testbaz.sketch");


    	//assertEquals(firstWordURL,"file");
	}

	public function testPages():Void
	{
		this.assertEquals(doc.pages().length,1);
		this.assertEquals(doc.currentPage().name(),"Page 1");
		var cur=doc.currentPage();
		var p=doc.addBlankPage();
		this.assertEquals(doc.currentPage().name(),"Page 2");
		doc.setCurrentPage(cur);
		this.assertEquals(cur,doc.currentPage());

		this.assertEquals(doc.pages().length,2);
		doc.removePage(p);
		this.assertEquals(doc.pages().length,1);
		this.assertEquals(doc.currentPage().name(),"Page 1");
		
	}
	public function testArtBoard():Void
	{

		var numArts=doc.artboards().length;
		if( numArts==0)
		this.assertEquals(numArts,0);
		//var a:MSArtboardGroup=untyped __js__('[MSArtboardGroup new]');
		var a:MSArtboardGroup=MSArtboardGroup.create();
		var frame= a.frame();
		frame.setWidth(200);
		untyped frame.width=300;
		frame.setHeight(200);
		untyped frame.height=300;
		a.setName("artboardTest");
		this.assertEquals(a.frame().width(),300);
		this.assertEquals(a.frame().height(),300);
		doc.currentPage().addLayer(a);
		
		a.removeFromParent();
		

	}
	public function testGroup():Void
	{
		var g= MSLayerGroup.create();
		doc.currentPage().addLayer(g);
		this.assertEquals(g.name(),"Group");
		g.removeFromParent();


	}
    
}