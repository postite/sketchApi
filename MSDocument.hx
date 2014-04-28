typedef MSSimpleGrid=Dynamic
// surely some other properties //todo
extern class SketchFile{
	public function path():String;
}
@:publicFields
extern class MSDocument{

public function setZoomValue(v:Float):Dynamic;
//Zoom the document. 1.0 represents actual size, 2.0 means 200% etc.

public function export():Dynamic;
//Takes you to the the export tool. Pass nil as the argument

public function exportPDFBook():Dynamic;
//A nice method not exposed in the UI at the moment:Dynamic; exports each slice on each page to a multi-page PDF file. Pass nil as the argument

public function showMessage():Dynamic;
//Pas a string to be displayed at the top of the canvas momentarily. The same method used for displaying the current zoom level and other tips.

public function artboards():SketchArray<MSArtboardGroup>;
public function slices():SketchArray<MSSliceLayer>;
//Both return an array representing the artboards and slices on the current page. Artboards are of type MSArtboardGroup and slices are of MSSliceLayer type

public function pages():SketchArray<MSPage>;
//Returns an array of all pages in the document. Each page is an MSPage object





//type: 0:String, 1:combo<Int> 2:explorer 
public inline function askForUserInput(msg:String,?ofType:Int=0,?initialValue:Dynamic):Dynamic{
	return untyped doc.askForUserInput_ofType_initialValue(msg,ofType,initialValue);
} //TODo no comprendo !

//Asks for user input and returns the value they chosen. The first argument is the label for the dialog panel, the second argument can be used to provide a default value. See User Input Examples for an example.
@:overload(function(bounds:MSSliceLayer,path:String):Void{})
@:overload(function(bounds:MSArtboardGroup,path:String):Dynamic{})
public inline function saveArtboardOrSlice(bounds:MSSlice,path:String):Void{
	return untyped this.saveArtboardOrSlice_toFile(bounds,path);
}
//Saves an area of the canvas to an image file. The first argument is a GKRect, MSSliceLayer or MSArtboardGroup and the image gets written to the file specified in the second argument. The file format is derived from the extension. See Exporting Areas for an example

public function  currentView():MSContentDrawView;
//Returns an MSContentDrawView subclass that represents the visible Canvas.

public function addBlankPage(p:MSPage):Void;
//Adds a new MSPage object to the document, inserting it below the current page, copying its grid and ruler position too. Available as of beta 184 / version 2.2.5

public function removePage(p:MSPage):Void;
//Removes the given page from the document. The argument is an MSPage object. Available as of beta 184 / version 2.2.5

//out of official api
//undocumented
function fileURL():MSDocument.SketchFile;
function saveDocument(t:Dynamic):Void; /// don't know which param
function displayName():String;
function setCurrentPage(p:MSPage):Void;
function currentPage():MSPage;

function renameLayer(l:MSLayer):Void;
function grid():MSSimpleGrid;
function documentData():MSDocumentData;



//slice stuff

inline function dataForSlice(slice:MSSliceLayer,ofType:Dynamic):Dynamic //(id)arg1 ofType:(id)arg2 ->(id)
	{
        return untyped __js__( 'doc.dataForSlice_ofType')(slice,ofType);
		
		//return null;
	}
inline function saveSlice(slice:MSSliceLayer,toFile:String):Void //arg1 toFile:(id)arg2 ->(void)
	{
		return untyped __js__( 'doc.saveSlice_toFile')(slice,toFile);
		//return null;
	
	}
function sliceForArtboardOrSlice(slice:MSSliceLayer):Dynamic;//(id)arg1;//(id)
function sliceForRect(rect:Dynamic):MSSliceLayer;//(id)arg1;->(id)

}




/*

@interface MSDocument : NSDocument <NSMenuDelegate, NSToolbarDelegate, NSWindowDelegate, MSDrawViewContentDelegate, MSBasicDelegate, MSBaseViewDelegate, MSDocumentDataDelegate, MSPageDelegate>
{
    MSDocumentData *documentData;
    MSActionsController *actionsController;
    MSInspectorController *inspectorController;
    MSToolbarConstructor *toolbarConstructor;
    MSEventHandlerManager *eventHandlerManager;
    MSLayerListViewController *layerListController;
    BOOL hasOpenedImageFile;
    MSRulerView *_horizontalRuler;
    MSRulerView *_verticalRuler;
    NSView *_rulerCornerView;
    MSContentDrawView *_contentDrawView;
    NSSplitView *_splitView;
    id _documentWindow;
    MSSplitViewDelegate *_splitViewController;
    NSView *_inspectorPlaceholderView;
    NSView *_miniToolbarView;
    MSIOSRefreshCollector *_refreshCollector;
    CHTransparentWindow *_overlayHelpWindow;
    MSDocumentMiniToolbarViewController *_miniToolbarController;
    NSArray *_selectedLayers;
}

+ (BOOL)autosavesInPlace;
+ (id)currentDocument;
@property(copy, nonatomic) NSArray *selectedLayers; // @synthesize selectedLayers=_selectedLayers;
@property(retain, nonatomic) MSDocumentMiniToolbarViewController *miniToolbarController; // @synthesize miniToolbarController=_miniToolbarController;
@property(retain, nonatomic) CHTransparentWindow *overlayHelpWindow; // @synthesize overlayHelpWindow=_overlayHelpWindow;
@property(readonly, nonatomic) MSIOSRefreshCollector *refreshCollector; // @synthesize refreshCollector=_refreshCollector;
@property(nonatomic) __weak NSView *miniToolbarView; // @synthesize miniToolbarView=_miniToolbarView;
@property(nonatomic) __weak NSView *inspectorPlaceholderView; // @synthesize inspectorPlaceholderView=_inspectorPlaceholderView;
@property(nonatomic) __weak MSSplitViewDelegate *splitViewController; // @synthesize splitViewController=_splitViewController;
@property(nonatomic) id documentWindow; // @synthesize documentWindow=_documentWindow;
@property(nonatomic) __weak NSSplitView *splitView; // @synthesize splitView=_splitView;
@property(nonatomic) __weak MSContentDrawView *contentDrawView; // @synthesize contentDrawView=_contentDrawView;
@property(nonatomic) __weak NSView *rulerCornerView; // @synthesize rulerCornerView=_rulerCornerView;
@property(nonatomic) __weak MSRulerView *verticalRuler; // @synthesize verticalRuler=_verticalRuler;
@property(nonatomic) __weak MSRulerView *horizontalRuler; // @synthesize horizontalRuler=_horizontalRuler;
@property(readonly) MSEventHandlerManager *eventHandlerManager; // @synthesize eventHandlerManager;
@property(retain, nonatomic) MSDocumentData *documentData; // @synthesize documentData;
@property(retain, nonatomic) MSToolbarConstructor *toolbarConstructor; // @synthesize toolbarConstructor;
@property(readonly) MSLayerListViewController *layerListController; // @synthesize layerListController;
@property(readonly) MSInspectorController *inspectorController; // @synthesize inspectorController;
@property(readonly, nonatomic) MSActionsController *actionsController; // @synthesize actionsController;
- (void).cxx_destruct;
- (void)determineCurrentArtboard;
- (void)layerSelectionDidChange;
- (void)collectRefreshRect:(struct CGRect)arg1 page:(id)arg2;
- (void)willRemovePage:(id)arg1;
- (void)didAddPage:(id)arg1;
- (void)didAddArtboard:(id)arg1 toPage:(id)arg2;
- (void)willRemoveArtboard:(id)arg1 fromPage:(id)arg2;
- (void)didUpdateDetailsForArtboard:(id)arg1;
- (void)didUpdateDetailsForPage:(id)arg1;
- (void)currentArtboardDidChange;
- (void)debugStressTestRendering:(id)arg1;
- (void)layerPositionPossiblyChanged;
- (void)startBackgroundCaching;
- (id)addBlankPage;
- (void)deactivateZoomToolButton;
- (void)zoomModeDidActivate;
- (void)toggleClickThrough:(id)arg1;
- (void)hideMessages;
- (void)findLayer:(id)arg1;
- (void)showCurrentArtboardPreview:(id)arg1;
- (void)redoAction:(id)arg1;
- (void)undoAction:(id)arg1;
- (void)toggleLayersAndInspectorVisibility:(id)arg1;
- (void)toggleInspectorVisibility:(id)arg1;
- (void)toggleLayerListVisibility:(id)arg1;
- (void)renameLayer:(id)arg1;
- (void)windowDidExitVersionBrowser:(id)arg1;
- (void)windowDidEnterVersionBrowser:(id)arg1;
- (void)colorMagnifierAction:(id)arg1;
- (void)copyCSSAttributes:(id)arg1;
- (id)pages;
- (id)layersSharingStyle:(id)arg1;
- (id)layerStyles;
- (id)textStyles;
- (void)removePage:(id)arg1;
- (void)setCurrentPage:(id)arg1;
- (id)artboards;
- (id)grid;
- (id)document;
- (void)pasteStyle:(id)arg1;
- (void)copyStyle:(id)arg1;
- (void)gridSettings:(id)arg1;
- (void)setStyleAsDefault:(id)arg1;
- (void)returnToDefaultHandler:(id)arg1;
- (id)defaultHandler;
- (id)setCurrentHandlerKey:(id)arg1;
- (id)toggleHandlerKey:(id)arg1;
- (void)reloadLayerList;
- (void)refreshViewsWithMask:(unsigned long long)arg1;
- (void)refreshOfType:(unsigned long long)arg1 rect:(struct CGRect)arg2;
- (id)rootDelegate;
- (void)deleteArtboards:(id)arg1;
- (void)closePath:(id)arg1;
- (void)menuNeedsUpdate:(id)arg1;
- (id)currentVerticalRulerData;
- (id)currentHorizontalRulerData;
- (void)documentData:(id)arg1 didChangeToPage:(id)arg2;
- (void)showMessage:(id)arg1 status:(BOOL)arg2;
- (void)showMessage:(id)arg1 status:(BOOL)arg2 character:(unsigned short)arg3;
- (void)showMessage:(id)arg1;
- (BOOL)inspectorIsMain;
- (void)popInspectorToRoot;
- (void)pushInspectorChild:(id)arg1;
- (void)caller:(id)arg1 showMessage:(id)arg2;
- (void)selectToolbarItemWithIdentifier:(id)arg1;
- (id)closestVisibleIdentifierInToolbarForIdentifier:(id)arg1;
- (void)reversePath:(id)arg1;
- (void)repeatLastTip:(id)arg1;
- (void)flagsChanged:(id)arg1;
- (void)windowDidResize:(id)arg1;
- (id)currentHandlerKey;
- (id)currentHandler;
- (void)toggleLayerHighlight:(id)arg1;
- (void)toggleSelection:(id)arg1;
- (void)lockLayer:(id)arg1;
- (void)hideLayer:(id)arg1;
- (void)togglePixelLines:(id)arg1;
- (void)toggleAlignmentGuides:(id)arg1;
- (void)validateMenuItemTitle:(id)arg1;
- (BOOL)validateItem:(id)arg1;
- (BOOL)validateMenuItem:(id)arg1;
- (BOOL)layerWouldOverlapExistingLayer:(id)arg1 inGroup:(id)arg2;
- (void)offsetLayerIfNecessary:(id)arg1 forInsertingInGroup:(id)arg2;
- (void)addLayer:(id)arg1;
- (id)findCurrentArtboardGroup;
- (void)coalescedDetermineArtboardNotification:(id)arg1;
- (void)showSelectedLayerSizeInToolbar;
- (void)putSelectionBackInCanvasIfPossible;
- (void)coalescedSelectionDidChangeNotification:(id)arg1;
- (id)findSelectedLayers;
- (id)currentPage;
- (void)exportPDFBook:(id)arg1;
- (void)export:(id)arg1;
- (id)selectedLayersOfClass:(Class)arg1;
- (void)returnToNormalHandler;
- (void)currentHandlerChanged;
- (void)zoomValueDidChangeTo:(double)arg1;
@property(nonatomic) double zoomValue; // @dynamic zoomValue;
@property(nonatomic) struct CGPoint scrollOrigin; // @dynamic scrollOrigin;
- (id)fileWrapperOfType:(id)arg1 error:(id *)arg2;
- (BOOL)shouldCancelAutoSave;
- (void)saveToURL:(id)arg1 ofType:(id)arg2 forSaveOperation:(unsigned long long)arg3 completionHandler:(CDUnknownBlockType)arg4;
- (BOOL)documentBundleContainsSVNFolders;
- (BOOL)canAsynchronouslyWriteToURL:(id)arg1 ofType:(id)arg2 forSaveOperation:(unsigned long long)arg3;
- (BOOL)readFromFileWrapper:(id)arg1 ofType:(id)arg2 error:(id *)arg3;
- (BOOL)readImageFromPath:(id)arg1 error:(id *)arg2;
- (void)resetImportedDocument:(id)arg1;
- (BOOL)readEPSFromURL:(id)arg1;
- (BOOL)readPDFFromURL:(id)arg1;
- (BOOL)readSVGFromURL:(id)arg1;
- (BOOL)readFromURL:(id)arg1 ofType:(id)arg2 error:(id *)arg3;
- (id)windowNibName;
- (id)toolbar;
- (BOOL)shouldCreateToolbar;
- (void)windowControllerDidLoadNib:(id)arg1;
- (void)loadLayerListPanel;
- (void)loadInspectorPanel;
- (void)windowWillEnterFullScreen:(id)arg1;
- (void)awakeFromNib;
- (BOOL)revertToContentsOfURL:(id)arg1 ofType:(id)arg2 error:(id *)arg3;
- (void)wireDocumentDataToUI;
- (id)currentView;
- (id)printOperationWithSettings:(id)arg1 error:(id *)arg2;
- (void)windowWillClose:(id)arg1;
- (void)windowDidBecomeKey:(id)arg1;
- (void)windowDidEndSheet:(id)arg1;
- (void)windowWillBeginSheet:(id)arg1;
- (id)window;
- (void)dealloc;
- (void)close;
- (void)closeHelpOverlayWindow;
- (void)setDelegatesToNil;
- (id)actionWithName:(id)arg1;
- (id)actions;
- (void)createActions;
- (id)init;
- (void)alignToKey:(id)arg1;
- (void)alignLayersBottom:(id)arg1;
- (void)alignLayersMiddle:(id)arg1;
- (void)alignLayersTop:(id)arg1;
- (void)alignLayersRight:(id)arg1;
- (void)alignLayersCenter:(id)arg1;
- (void)alignLayersLeft:(id)arg1;
- (void)stopAccessingFolderToken:(id)arg1;
- (id)startAccessingFolder:(id)arg1 tokenName:(id)arg2;
- (id)dataForSlice:(id)arg1 ofType:(id)arg2;
- (void)saveSlice:(id)arg1 toFile:(id)arg2;
- (id)sliceForArtboardOrSlice:(id)arg1;
- (void)saveArtboardOrSlice:(id)arg1 toFile:(id)arg2;
- (id)sliceForRect:(id)arg1;
- (id)askForUserInput:(id)arg1 ofType:(long long)arg2 initialValue:(id)arg3;
- (id)askForUserInput:(id)arg1 initialValue:(id)arg2;

@end
*/