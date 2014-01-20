package bs.examples;
import MSLayer;
import MSRect;
class Actions{

public function new()
{
	
}

// Distributes the selected elements horizontally, with the same distante beetween them.

public function AlignH()
{
	

//var spacing = [[doc askForUserInput:"Spacing" ofType:1 initialValue:10] integerValue];
var spacing = Global.doc.askForUserInput("spacing",1,10);
untyped log ( spacing);

var sorted_selection=null;
try{
sorted_selection = Global.selection.sort(sort_by_position);
// untyped log(sorted_selection.sort);
 //untyped log( sorted_selection);
// untyped __js__("sorted_selection=selection.sort(function(a,b){
//   //return [[a frame] left] - [[b frame] left];
//   log ('hello');
//   //return null;
//   return a.frame().left() - b.frame().left();
// })");
}catch(msg:Dynamic){
	untyped log( "err"+msg);
}
untyped log( sorted_selection);
var first_element = untyped sorted_selection[0];
var left_position = first_element.frame().left();
for (layer in sorted_selection){
	untyped log("bala");
	layer.frame().setX(left_position);
	left_position=layer.frame().left() + layer.frame().width() +spacing;
}
// sorted_selection.each(function(layer){
//   [[layer frame] setX:left_position];
//   left_position = [[layer frame] left] + [[layer frame] width] + spacing;
// });
// }
}

function sort_by_position(a:MSLayer,b:MSLayer){
  //return [[a frame] left] - [[b frame] left];
  untyped  log ("hello");
  //return null;
  return a.frame().left() - b.frame().left();
}

}