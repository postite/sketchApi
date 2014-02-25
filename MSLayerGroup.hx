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


//masks
public function layerHasMask(arg:Dynamic):Bool;
public function hasLayerWithMaskMode():Int;
public function calculateHasLayerWithMaskMode():Void; ///?

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


//// herite aussi de 

/*

@interface MSLayerGroup : _MSLayerGroup <MSArrayDelegate>
{
    long long ignoreChildrenRefreshCalls;
    BOOL _enableAutomaticScaling;
    BOOL _isOpen;
    BOOL _ignoreNextClickThrough;
    long long _hasLayerWithMaskMode;
}

+ (BOOL)layerHasMask:(id)arg1;
+ (BOOL)groupBoundsShouldBeIntegral;
+ (id)groupBoundsForLayers:(id)arg1;
@property(nonatomic) BOOL ignoreNextClickThrough; // @synthesize ignoreNextClickThrough=_ignoreNextClickThrough;
@property(nonatomic) BOOL isOpen; // @synthesize isOpen=_isOpen;
@property(nonatomic) long long hasLayerWithMaskMode; // @synthesize hasLayerWithMaskMode=_hasLayerWithMaskMode;
@property(nonatomic) BOOL enableAutomaticScaling; // @synthesize enableAutomaticScaling=_enableAutomaticScaling;
- (void)assignWithOriginalLinkedStyleIfNecessary;
- (id)children;
- (id)layerWithId:(id)arg1;
- (void)dataArray:(id)arg1 didRemoveObject:(id)arg2;
- (void)dataArray:(id)arg1 willRemoveObject:(id)arg2;
- (void)dataArray:(id)arg1 didAddObject:(id)arg2;
- (void)calculateHasLayerWithMaskMode;
- (void)fixParentConnections;
- (id)addLayerOfType:(id)arg1;
- (BOOL)calculateHasBlendedLayer;
- (void)resizeLayerByHeight:(id)arg1;
- (void)rectHeightDidChange:(id)arg1;
- (void)refreshOfType:(unsigned long long)arg1 rect:(struct CGRect)arg2;
- (void)rectWidthDidChange:(id)arg1;
- (BOOL)hitTestCornerOfSelectedLayer:(id)arg1 mouse:(struct CGPoint)arg2;
- (BOOL)shouldClickThroughGroup:(id)arg1 force:(BOOL)arg2;
- (id)layersBelowPoint:(struct CGPoint)arg1 forceClickThrough:(BOOL)arg2;
- (id)allLayersWithForcedClickThrough:(BOOL)arg1;
- (void)drawHoverWithZoom:(double)arg1;
- (id)inspectorViewControllerNames;
- (void)setConstrainProportions:(BOOL)arg1;
- (void)multiplyBy:(double)arg1;
- (id)layersSharingStyle:(id)arg1;
- (void)upgradeShapes;
- (void)markLayerAsChangedPassingTest:(CDUnknownBlockType)arg1;
- (void)enumerateLayersOfClass:(Class)arg1 withOptions:(unsigned long long)arg2 usingBlock:(CDUnknownBlockType)arg3;
- (void)enumerateLayersOfClass:(Class)arg1 usingBlock:(CDUnknownBlockType)arg2;
- (void)resizeRoot;
- (void)_resizeRoot;
- (id)requiredRect;
- (void)_adjustLayersWithOldOrigin:(struct CGPoint)arg1;
- (BOOL)handleDoubleClick;
- (id)handlerName;
- (BOOL)hitTest:(struct CGPoint)arg1;
- (void)setIsHovering:(BOOL)arg1;
- (BOOL)shouldDrawSelection;
- (void)changeLayerExpandedTypeToAutomaticIfCollapsed;
- (void)deselectLayerAndParent;
- (void)deselectAllLayers;
- (void)selectLayers:(id)arg1;
- (BOOL)containsSelectedItem;
- (void)setFrameAtMouseDown:(id)arg1;
- (void)resetRelativeRect;
- (void)recordRelativeRect;
- (void)prepareObjectCopy:(id)arg1;
- (struct CGRect)rectByAccountingForStyleSize:(struct CGRect)arg1;
- (void)markLayerDirtyOfType:(unsigned long long)arg1;
- (id)layers;
- (unsigned long long)indexOfLayer:(id)arg1;
- (id)layerAtIndex:(unsigned long long)arg1;
- (id)firstLayer;
- (void)addLayers:(id)arg1;
- (void)moveInLayerTreeInBlock:(CDUnknownBlockType)arg1;
- (void)insertLayers:(id)arg1 atIndex:(unsigned long long)arg2;
- (void)insertLayers:(id)arg1 afterLayer:(id)arg2;
- (void)removeLayerAtIndex:(unsigned long long)arg1;
- (void)insertLayer:(id)arg1 atIndex:(unsigned long long)arg2;
- (void)insertLayer:(id)arg1 afterLayer:(id)arg2;
- (void)insertLayer:(id)arg1 beforeLayer:(id)arg2;
- (void)removeLayer:(id)arg1;
- (BOOL)isValidChild:(id)arg1;
- (void)addLayer:(id)arg1;
- (void)setIsLocked:(BOOL)arg1;
- (id)bezierPath;
- (void)clearPositionCachesIncludingLocalCaches:(BOOL)arg1;
- (void)cacheDataForLightweightCopy:(id)arg1;
- (id)defaultStyle;
- (id)defaultName;
- (void)initObjectWithCoder:(id)arg1;
- (void)objectDidInit;
- (void)initEmptyObject;
- (id)CSSAttributeString;
- (BOOL)isExpandedInLayerList;
- (void)drawPreviewInRect:(struct CGRect)arg1 honourSelected:(BOOL)arg2;
- (void)addChildrenToElement:(id)arg1 exporter:(id)arg2;
- (id)addContentToElement:(id)arg1 attributes:(id)arg2 exporter:(id)arg3 action:(unsigned long long *)arg4;
- (Class)rendererClass;
- (unsigned long long)decodingConversionForProperty:(id)arg1;
- (void)initLegacyWithCoder:(id)arg1;

@end
*/

