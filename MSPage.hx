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
}

/*
@interface _MSPage : MSLayerGroup
{
    MSBaseGrid *_grid;
    MSRulerData *_horizontalRulerData;
    MSLayerContainer *_sliceContainer;
    MSRulerData *_verticalRulerData;
    double _zoomValue;
    struct CGPoint _scrollOrigin;
}

@property(nonatomic) double zoomValue; // @synthesize zoomValue=_zoomValue;
@property(retain, nonatomic) MSRulerData *verticalRulerData; // @synthesize verticalRulerData=_verticalRulerData;
@property(retain, nonatomic) MSLayerContainer *sliceContainer; // @synthesize sliceContainer=_sliceContainer;
@property(nonatomic) struct CGPoint scrollOrigin; // @synthesize scrollOrigin=_scrollOrigin;
@property(retain, nonatomic) MSRulerData *horizontalRulerData; // @synthesize horizontalRulerData=_horizontalRulerData;
@property(copy, nonatomic) MSBaseGrid *grid; // @synthesize grid=_grid;
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
- (void)setPrimitiveZoomValue:(double)arg1;
- (double)primitiveZoomValue;
- (void)setPrimitiveVerticalRulerData:(id)arg1;
- (id)primitiveVerticalRulerData;
- (void)setPrimitiveSliceContainer:(id)arg1;
- (id)primitiveSliceContainer;
- (void)setPrimitiveScrollOrigin:(struct CGPoint)arg1;
- (struct CGPoint)primitiveScrollOrigin;
- (void)setPrimitiveHorizontalRulerData:(id)arg1;
- (id)primitiveHorizontalRulerData;
- (void)setPrimitiveGrid:(id)arg1;
- (id)primitiveGrid;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end*/