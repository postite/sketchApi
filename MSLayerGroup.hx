import MSLayer;
extern class  MSLayerGroup extends MSLayer{

override public function layers():SketchArray<MSLayer>;
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

/*
@interface _MSLayerGroup : MSStyledLayer
{
    BOOL _hasClickThrough;
    MSLayerContainer *_layerContainer;
}

@property(retain, nonatomic) MSLayerContainer *layerContainer; // @synthesize layerContainer=_layerContainer;
@property(nonatomic) BOOL hasClickThrough; // @synthesize hasClickThrough=_hasClickThrough;
- (void).cxx_destruct;
- (void)copyPropertiesToObjectCopy:(id)arg1;
- (void)setUndoManagerOnChildren:(id)arg1;
- (void)setAsParentOnChildren;
- (void)decodePropertiesCompatibleWithCoder:(id)arg1;
- (void)decodePropertiesManuallyWithCoder:(id)arg1;
- (void)decodePropertiesWithCoder:(id)arg1;
- (void)encodePropertiesCompatibleWithCoder:(id)arg1;
- (void)encodePropertiesManuallyWithCoder:(id)arg1;
- (void)encodePropertiesWithCoder:(id)arg1;
- (void)fillInEmptyObjects;
- (BOOL)hasDefaultValues;
- (void)initEmptyObject;
- (void)setPrimitiveLayerContainer:(id)arg1;
- (id)primitiveLayerContainer;
- (void)setPrimitiveHasClickThrough:(BOOL)arg1;
- (BOOL)primitiveHasClickThrough;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end
*/