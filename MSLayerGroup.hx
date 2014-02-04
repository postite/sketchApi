import MSLayer;
extern class  MSLayerGroup{
extern class  MSLayerGroup extends MSLayer{

public function layers():SketchArray<MSLayer>;
//Returns an array of all layers in the group - not including any of their children. In this way you can see that a document is basically a tree structure of layers & groups.

public function allLayers():SketchArray<MSLayer>;
//Returns an array of all layers in the group, including those in any sub-groups that have click-through enabled. Basically this array contains all layers that are directly selectable from within this group.

public function resizeRoot():Dynamic;
//Resizes the group to fit around all of its sub-layers.

public function addLayer():Void;
//Add a layer to this group

public function removeLayer():Void;
//Remove a layer from this group

public function addLayerOfType():Void;
//Adds a completely new layer to the group, at the groups 0,0 origin. This method takes one argument; a string which indicates the kind of layer. Currently the only supported values are: "rectangle" and "text". This method returns the new layer which you can then manipulate/style using the other scripting methods


}