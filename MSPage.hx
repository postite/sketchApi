extern class MSPage extends MSLayerGroup{

//MSPage is a subclass of MSLayerGroup that represents a page of the document. The -frame parameter of an MSPage is not useful as its not guaranteed to contain all layers on the page. Hoever do check out MSLayerGroup as there are useful methods in there as well

public function contentBounds():GKRect;
//If you want a rectangle around everything on the canvas, use this. It returns a GKRect object that you can use to export from. Such as described in Exporting Areas.

public function allSlices():SketchArray<MSSliceLayer>;
//Returns an array of all slices in the document and its enclosing artboards. To get an array of just the artboards on the page itself, use:

public function slices():SketchArray<MSSliceLayer>;
//Returns an array of all slices on the page, not including artboards

public function artboards():SketchArray<MSArtboardGroup>;
//Returns an array of all artboards on the page.

override public function duplicate():MSPage;  //SketchBug ? return but doesn't insert
//Duplicates the Page, inserts it just below this page. Returns the new page. Available as of beta 184 / version 2.2.5

public function horizontalRulerData():MSRulerData;
//public var verticalRulerData:Dynamic;
//Both return the MSRulerData object used to store rulers for their respective axes. Note that this data is only used if there's no artboard on the page. MSArtboardGroup has similar methods for itself

// undocumented 
public function currentArtboard():MSArtboardGroup;
public function setCurrentArtboard(art:MSArtboardGroup):Void;
override public function name():String;

public function addSlice(s:Dynamic):Void;




/* NEXT */

public function copyLightweight():Dynamic;


}

/*
SKETCH 3
#import "_MSPage.h"

#import "MSRootLayer.h"

@class MSArtboardGroup, MSBaseGrid, MSRulerData, NSArray;

@interface MSPage : _MSPage <MSRootLayer>
{
    long long ignoreLayerSelectionDidChangeNotificationsCounter;
    BOOL _hasBlendedLayer;
    BOOL _shouldSkipCalculatingLayerBlending;
    id <MSBasicDelegate> _delegate;
    id <MSPageDelegate> _pageDelegate;
    MSArtboardGroup *_currentArtboard;
    NSArray *_cachedArtboards;
    NSArray *_cachedExportableLayers;
}

+ (id)page;
@property(retain, nonatomic) NSArray *cachedExportableLayers; // @synthesize cachedExportableLayers=_cachedExportableLayers;
@property(retain, nonatomic) NSArray *cachedArtboards; // @synthesize cachedArtboards=_cachedArtboards;
@property(nonatomic) BOOL shouldSkipCalculatingLayerBlending; // @synthesize shouldSkipCalculatingLayerBlending=_shouldSkipCalculatingLayerBlending;
@property(nonatomic) BOOL hasBlendedLayer; // @synthesize hasBlendedLayer=_hasBlendedLayer;
@property(retain, nonatomic) MSArtboardGroup *currentArtboard; // @synthesize currentArtboard=_currentArtboard;
@property(nonatomic) __weak id <MSPageDelegate> pageDelegate; // @synthesize pageDelegate=_pageDelegate;
@property(nonatomic) __weak id <MSBasicDelegate> delegate; // @synthesize delegate=_delegate;
- (void).cxx_destruct;
- (BOOL)parentOrSelfIsSymbol;
- (void)moveLayersToArtboards;
- (double)defaultZoomValue;
- (void)scheduleCalculateHasBlendedLayer;
- (BOOL)isValidChild:(id)arg1;
- (id)ancestorsOfLayer:(id)arg1 inGroup:(id)arg2;
- (id)ancestorsOfLayer:(id)arg1;
- (void)ignoreLayerSelectionDidChangeNotificationsInBlock:(CDUnknownBlockType)arg1;
- (void)layerSelectionDidChange;
- (void)dataArray:(id)arg1 willRemoveObject:(id)arg2;
- (void)dataArray:(id)arg1 didAddObject:(id)arg2;
- (void)changeLayerExpandedTypeToAutomaticIfCollapsed;
@property(readonly, nonatomic) NSArray *artboards; // @dynamic artboards;
- (void)setCurrentGrid:(id)arg1;
- (id)currentGrid;
- (id)parentRoot;
- (id)currentRoot;
- (id)ancestorTransforms;
- (id)ancestors;
- (id)parentPage;
- (id)contentBoundsForLayer:(id)arg1;
- (id)contentBounds;
- (void)resizeRoot;
- (id)destinationArtboardForLayer:(id)arg1 artboards:(id)arg2;
- (void)addOrRemoveLayerFromArtboardIfNecessary:(id)arg1;
- (void)tryToMoveLayer:(id)arg1 toArtboards:(id)arg2;
- (void)tryToMoveLayerToArtboard:(id)arg1;
- (id)exportableLayers;
- (id)symbolLayersInGroup:(id)arg1;
- (id)artboardForSlice:(id)arg1 inArtboards:(id)arg2;
- (id)sliceLayerFromSlice:(id)arg1;
- (void)prepareObjectCopy:(id)arg1;
- (void)childDidChangeNotification:(id)arg1;
@property(nonatomic) struct CGPoint rulerBase; // @dynamic rulerBase;
- (void)refreshViewsWithMask:(unsigned long long)arg1;
- (void)refreshOfType:(unsigned long long)arg1 rect:(struct CGRect)arg2;
- (id)transform;
- (void)setCachedPagesMenuPreview:(id)arg1;
- (id)cachedPagesMenuPreview;
- (void)sendMessageToRootObject:(unsigned long long)arg1;
- (void)handleLightweightObjectChangeForKey:(id)arg1 sender:(id)arg2;
- (void)setName:(id)arg1;
- (void)refreshForPropertyChanged:(id)arg1;
- (void)dealloc;
- (id)defaultName;
- (id)parentGroup;
- (id)initWithFrame:(struct CGRect)arg1;
- (void)objectDidInit;
- (Class)rendererClass;
- (void)migratePropertiesFromV21OrEarlierWithCoder:(id)arg1;
- (id)artboardGroupFromArtboard:(id)arg1;
- (void)migrateArtboardsToArtboardGroups:(id)arg1;
- (id)moveSlicesToArtboards:(id)arg1;
- (id)migrateLegacySlicesToSliceLayers:(id)arg1;
- (void)decodeLegacyArtboards:(id)arg1;
- (void)decodeLegacySlices:(id)arg1;
- (unsigned long long)decodingConversionForProperty:(id)arg1;
- (void)initLegacyWithCoder:(id)arg1;
- (BOOL)intersectsSlice:(id)arg1;
- (BOOL)shouldIncludeLayerInSlice:(id)arg1;
- (void)appendBaseTranslation:(id)arg1 exporter:(id)arg2;
- (struct CGPoint)layerOffsetWithExporter:(id)arg1;

// Remaining properties
@property(copy, nonatomic) MSBaseGrid *grid;
@property(copy, nonatomic) MSRulerData *horizontalRulerData;
@property(copy, nonatomic) MSRulerData *verticalRulerData;

@end

*/