package bs.examples;
import bs.BomberCommands;
import MSLayer;
import MSRect;
class Actions{


var spacing:Int;
var selection:SketchArray<MSLayer>;
var hxSelection:Array<MSLayer>;
public function new()
{
	
selection = cast Global.selection;

hxSelection = selection.iterator().haxeArray();
}

function requestUser()
{
	spacing = Global.doc.askForUserInput("spacing",1,10);
}

// Distributes the selected elements horizontally, with the same distante beetween them.

public function AlignH()
{
	

//var spacing = [[doc askForUserInput:"Spacing" ofType:1 initialValue:10] integerValue];

requestUser();



hxSelection.sort(sort_by_positionX);

var first_element = untyped hxSelection[0];
var left_position = first_element.frame().left();
for (layer in hxSelection){
	layer.frame().setX(left_position);
	left_position=layer.frame().left() + layer.frame().width() +spacing;
}

}

public function AlignV()
{
	
requestUser();
hxSelection.sort(sort_by_positionY);

var first_element = untyped hxSelection[0];
var top_position = first_element.frame().top();
for (layer in hxSelection){
	layer.frame().setY(top_position);
	top_position=layer.frame().top() + layer.frame().height() +spacing;
}
}

function sort_by_positionX(a:MSLayer,b:MSLayer):Int{
  //return [[a frame] left] - [[b frame] left];
  untyped  log ("hello");
  //return null;
  return a.frame().left() - b.frame().left();
}
function sort_by_positionY(a:MSLayer,b:MSLayer):Int{
  //return [[a frame] left] - [[b frame] left];
  untyped  log ("hello");
  //return null;
  return a.frame().top() - b.frame().top();
}

}


class Alpha{

	public function new()
	{
	var alpha = Global.doc.askForUserInput("Opacity percentage?",1,100);

	for (l in Global.selection)
		l.style().contextSettings().setOpacity(alpha/100);
	}
}

class Effects{

	public function new (){}
	public function offset(){
	if (Global.selection[0] != null) {
  	var offset = Global.doc.askForUserInput("Offset distance (in pixels):",1,100);
  	for ( layer in Global.selection){
    		var frame = layer.frame();
		
    		var copy = layer.duplicate();
    		var frame2 = copy.frame();
		
    		// [frame2 setHeight:  [frame height] + (offset*2)];
    		frame2.setHeight( frame.height() +offset*2);
    		// [frame2 setWidth: [frame width] + (offset*2)];
			frame2.setWidth(frame.width() + offset*2);
    		// [frame2 setX: [frame x] + [frame width]/2 - [frame2 width]/2];
    		frame2.setX(frame.x() +frame.width()/2 -frame2.width()/2);
    		// [frame2 setY: [frame y] + [frame height]/2 - [frame2 height]/2];
    		frame2.setY(frame.y()+frame.height()/2 -frame2.height()/2);
  			}
	} else {
  	BomberCommands.alert("You need to select at least one layer.");
	}
	}

	public function repeatH(){
		var repeats:Int = Global.doc.askForUserInput("Repeats",1,9);

		for ( layer in Global.selection){
  			var frame = layer.frame();
  				for (r in 0...repeats){
  			
    				var copy = layer.duplicate();
        			var frame2 = copy.frame();

    		//[frame2 setX:[frame x] + ([frame width]+10)*r]
    				frame2.setX(frame.x() + (frame.width()+10)*r);
    			}
  		}
	}
}