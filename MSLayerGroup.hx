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
public function isActualSymbol():Bool;


//masks

public static function layerHasMask(group:MSLayer):Bool;
public function hasLayerWithMaskMode():Int;
public function calculateHasLayerWithMaskMode():Void; ///?

}
/*
Sketch3



//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "_MSLayerGroup.h"

#import "MSArrayDelegate.h"
#import "MSSharedObjectInstance.h"

@class NSString;

@interface MSLayerGroup : _MSLayerGroup <MSArrayDelegate, MSSharedObjectInstance>
{
    long long ignoreChildrenRefreshCalls;
    BOOL _enableAutomaticScaling;
    BOOL _isOpen;
    BOOL _ignoreNextClickThrough;
    BOOL _ignoreNextSymbolSyncChange;
    BOOL _lightweightContainsSelectedItem;
    long long _hasLayerWithMaskMode;
}

+ (BOOL)layerHasMask:(id)arg1;
+ (BOOL)groupBoundsShouldBeIntegral;
+ (id)groupBoundsForLayers:(id)arg1;
+ (void)setIgnoreLayerListDelegateCalls:(BOOL)arg1;
+ (id)sharedObjectIDsFromLayers:(id)arg1;
@property(nonatomic) BOOL lightweightContainsSelectedItem; // @synthesize lightweightContainsSelectedItem=_lightweightContainsSelectedItem;
@property(nonatomic) BOOL ignoreNextSymbolSyncChange; // @synthesize ignoreNextSymbolSyncChange=_ignoreNextSymbolSyncChange;
@property(nonatomic) BOOL ignoreNextClickThrough; // @synthesize ignoreNextClickThrough=_ignoreNextClickThrough;
@property(nonatomic) BOOL isOpen; // @synthesize isOpen=_isOpen;
@property(nonatomic) long long hasLayerWithMaskMode; // @synthesize hasLayerWithMaskMode=_hasLayerWithMaskMode;
@property(nonatomic) BOOL enableAutomaticScaling; // @synthesize enableAutomaticScaling=_enableAutomaticScaling;
- (BOOL)parentOrSelfIsSymbol;
- (unsigned long long)type;
- (void)addSlice:(id)arg1;
- (void)assignWithOriginalLinkedStyleIfNecessary;
- (id)children;
- (id)layerWithId:(id)arg1;
- (void)dataArray:(id)arg1 didRemoveObject:(id)arg2;
- (void)dataArray:(id)arg1 willRemoveObject:(id)arg2;
- (void)dataArray:(id)arg1 didAddObject:(id)arg2;
- (BOOL)isEqualForSync:(id)arg1;
- (void)calculateHasLayerWithMaskMode;
- (id)addLayerOfType:(id)arg1;
- (BOOL)calculateHasBlendedLayer;
- (void)resizeLayerByHeight:(id)arg1;
- (void)rectHeightDidChange:(id)arg1;
- (void)refreshOfType:(unsigned long long)arg1 rect:(struct CGRect)arg2;
- (void)rectWidthDidChange:(id)arg1;
- (BOOL)hitTestCornerOfSelectedLayer:(id)arg1 mouse:(struct CGPoint)arg2;
- (BOOL)shouldClickThroughGroup:(id)arg1 mouse:(struct CGPoint)arg2 force:(BOOL)arg3;
- (id)layersBelowPoint:(struct CGPoint)arg1 forceClickThrough:(BOOL)arg2 keepLockedLayers:(BOOL)arg3;
- (id)allLayersWithForcedClickThrough:(BOOL)arg1;
- (void)drawHoverWithZoom:(double)arg1;
- (id)inspectorViewControllerNames;
- (void)setConstrainProportions:(BOOL)arg1;
- (void)multiplyBy:(double)arg1;
- (id)layersSharingStyle:(id)arg1;
- (void)upgradeShapes;
- (void)markLayerAsChangedPassingTest:(CDUnknownBlockType)arg1;
- (id)layersSatisfyingTest:(CDUnknownBlockType)arg1;
- (void)enumerateLayersInReverse:(CDUnknownBlockType)arg1;
- (void)enumerateChangingLayers:(CDUnknownBlockType)arg1;
- (void)enumerateLayers:(CDUnknownBlockType)arg1;
- (void)enumerateLayersOfClass:(Class)arg1 withOptions:(unsigned long long)arg2 usingBlock:(CDUnknownBlockType)arg3;
- (void)enumerateLayersOfClass:(Class)arg1 usingBlock:(CDUnknownBlockType)arg2;
- (void)enumerateSelfAndLayersOfClass:(Class)arg1 usingBlock:(CDUnknownBlockType)arg2;
- (void)resizeRoot;
- (void)_resizeRoot;
- (id)requiredRect;
- (void)_adjustLayersWithOldOrigin:(struct CGPoint)arg1;
- (BOOL)handleDoubleClick;
- (id)handlerName;
- (void)setIsHovering:(BOOL)arg1;
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
- (unsigned long long)indexOfLayer:(id)arg1;
- (id)layerAtIndex:(unsigned long long)arg1;
- (id)firstLayer;
- (void)addLayers:(id)arg1;
- (void)moveInLayerTreeInBlock:(CDUnknownBlockType)arg1;
- (void)insertLayers:(id)arg1 atIndex:(unsigned long long)arg2;
- (void)removeAllLayers;
- (void)insertLayers:(id)arg1 afterLayer:(id)arg2;
- (void)removeLayerAtIndex:(unsigned long long)arg1;
- (void)insertLayer:(id)arg1 atIndex:(unsigned long long)arg2;
- (void)insertLayer:(id)arg1 afterLayer:(id)arg2;
- (void)insertLayer:(id)arg1 beforeLayer:(id)arg2;
- (void)removeLayer:(id)arg1;
- (unsigned long long)numberOfLayers;
- (void)replaceLayersWithoutNotifications:(id)arg1;
- (void)setLayers:(id)arg1;
- (BOOL)containsSymbols;
- (BOOL)wouldInsertSymbolIntoItself:(id)arg1;
- (BOOL)isValidChild:(id)arg1;
- (void)makeGroupWithSliceLayers:(id)arg1;
- (void)addLayer:(id)arg1;
- (void)setIsLocked:(BOOL)arg1;
- (BOOL)hasClickThrough;
- (id)bezierPath;
- (void)clearPositionCachesIncludingLocalCaches:(BOOL)arg1;
- (id)defaultStyle;
- (id)defaultName;
- (void)handleLightweightObjectChangeForKey:(id)arg1 sender:(id)arg2;
- (BOOL)isActualSymbol;
- (void)objectDidInit;
- (void)initEmptyObject;
- (id)CSSAttributeString;
- (BOOL)isExpandedInLayerList;
- (void)drawPreviewInRect:(struct CGRect)arg1 honourSelected:(BOOL)arg2;
- (Class)rendererClass;
- (void)migratePropertiesFromV25OrEarlierWithCoder:(id)arg1;
- (unsigned long long)decodingConversionForProperty:(id)arg1;
- (void)initLegacyWithCoder:(id)arg1;
- (void)addChildrenToElement:(id)arg1 exporter:(id)arg2;
- (id)addContentToElement:(id)arg1 attributes:(id)arg2 exporter:(id)arg3 action:(unsigned long long *)arg4;

// Remaining properties
@property(retain, nonatomic) NSString *sharedObjectID;

@end


*/

