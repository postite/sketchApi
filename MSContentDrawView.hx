extern class MSContentDrawView {
//This object is canvas view. You can get to it via -currentView on MSDocument. Many of the standard Cocoa actions work here as expected such as

public function cut():Void;
 public function copy():Void;
public function paste():Void;

//Each of these take argument that is not used further, so just supply nil

public function zoomIn():Void;
public function zoomOut():Void;
//Zooms in by 2x or out by the same amount. Again, supply a nil argument

public function actualSize():Void;
//Zooms back to 100%. Provide a nil argument

public function centerRect(rect:GKRect):Void; //take a relative 
//Centers an arbitrary rectangle in the canvas.
// The Argument is expected to be a GKRect. Note that MSRect provides an easy way to get a GKRect as well as does absoluteRect() 
//on MSLayer

public function zoomToFitRect(rect:GKRect):Void; // take an absoluteRect

//Zooms the canvas in or out and scrolls to fit supplied GKRect argument in the view.

}


/*

@interface MSContentDrawView : MSBaseView <MSBasicDelegate, MSTileRemoveCollector>
{
    NSEvent *lastEvent;
    struct CGPoint mouseBeforePinch;
    BOOL handToolIsActive;
    struct CGPoint handToolOriginalPoint;
    struct CGPoint handToolOriginalScrollOrigin;
    BOOL zoomToolIsActive;
    BOOL zoomToolActivatedByKey;
    struct CGPoint zoomToolStartPoint;
    struct CGPoint zoomToolEndPoint;
    MSRulerView *horizontalRuler;
    MSRulerView *verticalRuler;
    BOOL didMouseDown;
    BOOL hasDraggedOutsideInitialPadding;
    struct CGPoint mouseDownPoint;
    BOOL _lastActualZoomScrollOriginSaved;
    MSDocument *_document;
    CALayer *_masterTileLayer;
    MSTilePlacer *_layerTiler;
    long long _animatingZoomCounter;
    double _zoomDeltaDuringPinch;
    double _zoomValueAfterAnimating;
    NSTimer *_refreshTimer;
    double _refreshDelay;
    NSMutableArray *_collectors;
    struct CGPoint _lastActualZoomScrollOrigin;
    struct CGRect _dirtyContentRect;
    struct CGRect _dirtyOverlayRect;
}

@property(retain, nonatomic) NSMutableArray *collectors; // @synthesize collectors=_collectors;
@property(nonatomic) double refreshDelay; // @synthesize refreshDelay=_refreshDelay;
@property(nonatomic) struct CGRect dirtyOverlayRect; // @synthesize dirtyOverlayRect=_dirtyOverlayRect;
@property(nonatomic) struct CGRect dirtyContentRect; // @synthesize dirtyContentRect=_dirtyContentRect;
@property(retain, nonatomic) NSTimer *refreshTimer; // @synthesize refreshTimer=_refreshTimer;
@property(nonatomic) BOOL lastActualZoomScrollOriginSaved; // @synthesize lastActualZoomScrollOriginSaved=_lastActualZoomScrollOriginSaved;
@property(nonatomic) struct CGPoint lastActualZoomScrollOrigin; // @synthesize lastActualZoomScrollOrigin=_lastActualZoomScrollOrigin;
@property(nonatomic) double zoomValueAfterAnimating; // @synthesize zoomValueAfterAnimating=_zoomValueAfterAnimating;
@property(nonatomic) double zoomDeltaDuringPinch; // @synthesize zoomDeltaDuringPinch=_zoomDeltaDuringPinch;
@property(nonatomic) long long animatingZoomCounter; // @synthesize animatingZoomCounter=_animatingZoomCounter;
@property(retain, nonatomic) MSTilePlacer *layerTiler; // @synthesize layerTiler=_layerTiler;
@property(retain, nonatomic) CALayer *masterTileLayer; // @synthesize masterTileLayer=_masterTileLayer;
@property(nonatomic) __weak MSDocument *document; // @synthesize document=_document;
@property(readonly) BOOL zoomToolIsActive; // @synthesize zoomToolIsActive;
@property __weak MSRulerView *verticalRuler; // @synthesize verticalRuler;
@property __weak MSRulerView *horizontalRuler; // @synthesize horizontalRuler;
- (void).cxx_destruct;
- (void)dealloc;
- (void)layerPositionPossiblyChanged;
- (void)ignoreNextKeyDownEventUntilModifiersChange;
- (void)refresh;
- (void)windowDidResize:(id)arg1;
- (void)hideMessages;
- (void)scrollPageDown:(id)arg1;
- (void)scrollPageUp:(id)arg1;
- (void)smartMagnifyWithEvent:(id)arg1;
- (BOOL)canDrawConcurrently;
- (void)currentHandlerChanged;
- (void)setDelegate:(id)arg1;
- (void)setOutletsToNil;
- (void)zoomValueDidChangeTo:(double)arg1;
- (void)didUndoNotification:(id)arg1;
- (void)willUndoNotification:(id)arg1;
- (BOOL)inspectorIsMain;
- (void)popInspectorToRoot;
- (void)pushInspectorChild:(id)arg1;
- (void)selectToolbarItemWithIdentifier:(id)arg1;
- (void)caller:(id)arg1 showMessage:(id)arg2;
- (void)refreshViewsWithMask:(unsigned long long)arg1;
- (void)reloadLayerList;
- (id)defaultHandler;
- (id)undoManager;
- (id)pages;
- (id)currentPage;
- (id)currentView;
- (id)selectedLayers;
- (void)flagsChanged:(id)arg1;
- (id)setCurrentHandlerKey:(id)arg1;
- (id)currentHandlerKey;
- (void)toggleHandlerKey:(id)arg1;
- (void)changeColor:(id)arg1;
- (void)cursorUpdate:(id)arg1;
- (void)resetCursorRects;
- (void)addLayer:(id)arg1;
- (void)changeFont:(id)arg1;
- (BOOL)isOpaque;
- (void)setLastEvent:(id)arg1;
- (id)lastEvent;
- (void)refreshOfType:(unsigned long long)arg1 rect:(struct CGRect)arg2;
- (void)didFinishAnimatingZoom;
- (void)willStartAnimatingZoom;
- (struct CGRect)visibleContentRect;
- (void)animateToViewPort:(id)arg1;
- (void)animateScrollOriginToPoint:(struct CGPoint)arg1;
- (struct CGPoint)currentMidPointFromScrollOrigin:(struct CGPoint)arg1 zoomValue:(double)arg2;
- (struct CGPoint)currentMidPoint;
- (void)actualSize;
- (double)currentZoomValueAccountingForAnimation;
- (double)zoomValueAfterZoomOut;
- (void)zoomOut;
- (double)zoomValueAfterZoomIn;
- (void)setZoomValueCenteredInCanvas:(double)arg1;
- (void)refreshOverlays;
- (void)animatedZoomDidEndAtMidPoint:(struct CGPoint)arg1;
- (void)animateToZoom:(double)arg1 fromPoint:(struct CGPoint)arg2;
- (void)animateToZoom:(double)arg1;
- (void)zoomIn;
- (id)menuForEvent:(id)arg1;
- (BOOL)wantsPeriodicDraggingUpdates;
- (BOOL)performDragOperation:(id)arg1;
- (unsigned long long)draggingUpdated:(id)arg1;
- (BOOL)prepareForDragOperation:(id)arg1;
- (void)draggingExited:(id)arg1;
- (unsigned long long)draggingEntered:(id)arg1;
- (BOOL)resignFirstResponder;
- (BOOL)becomeFirstResponder;
- (BOOL)acceptsFirstResponder;
- (BOOL)acceptsFirstMouse:(id)arg1;
- (void)insertBacktab:(id)arg1;
- (void)insertTab:(id)arg1;
- (void)keyUp:(id)arg1;
- (BOOL)performActionWithName:(id)arg1;
- (BOOL)interpretKeyEvent:(id)arg1;
- (void)keyDown:(id)arg1;
- (void)insertText:(id)arg1;
- (void)doCommandBySelector:(SEL)arg1;
- (void)calculateMouseBeforePinch;
- (void)setZoomValueFromGestureEvent:(double)arg1;
- (void)magnifyWithEvent:(id)arg1;
- (void)reloadAllTiles;
- (void)clearTiles;
- (void)displayPropertiesDidChange;
- (void)resetMasterTileLayer;
- (struct CGPoint)scrollOriginAfterMagnify;
- (BOOL)userDidMagnify;
- (void)tileRemoveCollectorDidFinish:(id)arg1;
- (void)animationDidFinishAtZoomValue:(double)arg1 scrollOrigin:(struct CGPoint)arg2;
- (void)touchesEndedWithEvent:(id)arg1;
- (BOOL)acceptsTouchEvents;
- (void)scrollWheel:(id)arg1;
- (id)viewPortForZoomToFitRect:(id)arg1;
- (void)zoomToFitRect:(id)arg1;
- (id)totalRectForLayers:(id)arg1;
- (void)zoomToSelection;
- (void)centerSelectionInVisibleArea;
- (void)centerLayersInCanvas;
- (void)centerRect:(id)arg1 animated:(BOOL)arg2;
- (void)centerRect:(id)arg1;
- (void)centerSelection;
- (void)mouseMoved:(id)arg1;
- (void)mouseUp:(id)arg1;
- (void)doMouseDraggedEvent:(id)arg1;
- (void)mouseDraggedOutsideCanvas;
- (BOOL)isPointOutsideCanvas:(struct CGPoint)arg1;
- (void)mouseDragged:(id)arg1;
- (void)endRefreshCoalescing;
- (void)beginRefreshCoalescing;
- (void)mouseDown:(id)arg1;
- (void)mouseExited:(id)arg1;
- (id)grid;
- (void)placeScrollOriginInTopLeft;
- (BOOL)group:(id)arg1 containsLayerOfType:(Class)arg2;
- (void)centerInBounds;
- (void)refreshTiles;
- (void)scheduleRefreshTiles;
- (void)baseRefreshOfType:(unsigned long long)arg1 rect:(struct CGRect)arg2;
- (void)setZoomValue:(double)arg1;
- (void)setScrollOrigin:(struct CGPoint)arg1 moveTiles:(BOOL)arg2;
- (void)prepareTile:(id)arg1;
- (id)newMasterTileLayer;
- (void)enableLayerBackedDrawing;
- (void)pixelGridDidChange;
- (void)awakeFromNib;
- (long long)tag;
- (void)initialize;
- (void)handToolMouseUp;
- (void)handToolMouseDragged:(id)arg1;
- (void)handToolMouseDown:(id)arg1;
- (void)endHandToolMode;
- (void)beginHandToolMode;
- (void)drawZoomTool;
- (BOOL)shouldZoomIntoRect;
- (void)zoomToolMouseUp:(id)arg1;
- (struct CGRect)zoomRect;
- (void)applyZoomCursor;
- (void)zoomToolMouseDragged:(id)arg1;
- (void)zoomTooMouseMoved:(id)arg1;
- (void)zoomToolMouseDown:(id)arg1;
- (void)zoomToolFlagsChanged:(id)arg1;
- (struct CGPoint)zoomPointFromEvent:(id)arg1;
- (void)endZoomToolMode;
- (void)beginZoomToolMode;

@end
*/