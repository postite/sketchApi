/*
 * <p>//MSLayer is the base class that represents a layer object. The main attributes are:</p>
 *
 * <p>To iterate over the hierarchy, use the parent, firstChild, next and firstComponent fields. For
 * example:</p>
 *
 * <pre>
 * // Iterate over entity's children
 * var child = entity.firstChild;
 * while (child != null) {
 *     var next = child.next; // Store in case the child is removed in process()
 *     process(child);
 *     child = next;
 * }
 * </pre>
 */
import GKRect;
typedef Path={
    points:SketchArray<MSCurvePoint>
}

@:publicFields
extern class MSLayer{

//untested
	inline  static public function create():MSLayerGroup{

    return untyped __js__("[MSLayer new]");
}


/**
     * Determines size and position on the canvas.
     * @returns An instance of MSRect..
     */
public function frame():MSRect;
/**
* Determines all style-related attributes such as Borders, Fills, Shadows and more
*@returns An instance of MSStyle.
**/
public function style():MSStyle;
// function get_style()return style;

//The name of the layer as it appears in the layer list. An NSString
public function name():String; // not a realString ? doesnt work well with subfr for ex:
public function setName(name:String):Void;

//Returns true if the layer is visible - that is, not hidden
public function isVisible():Bool;
public function setIsVisible(t:Bool):Void;

//Returns true if the user locked the layer
public function isLocked():Bool;
public function setIsLocked(t:Bool):Void;

public function rotation():Int;
/**
                rotates the layer.

                @param Int in degrees.
                        

                         <pre>trace(layer.setRotation(30));</pre>

                @return Void.
        **/
public function setRotation(deg:Int):Void;
//An integer denoting the rotation of the layer - in degrees. Rotation happens counter-clockwise
public function isFlippedHorizontal():Bool;
public function setIsFlippedHorizontal(t:Bool):Void;
public function isFlippedVertical():Bool;
public function setIsFlippedVertical(t:Bool):Void;
//Flips the layer horizontal or vertical

public function parentGroup():MSLayer; //todo
//Returns the parent group of this layer. Note that this can return an MSPage or MSArtboardGroup as well
public function isSelected():Bool;
public function setIsSelected(t:Bool):Void;
//True if the layer is selected.
public function absoluteRect():GKRect;
//Returns a GKRect object that returns the bounds of this layer in absolute coordinates; it takes into account the layer's rotation and that of any of its parents.

//new in 3 
public function relativeRect():CGRect; //untested
public function duplicate():MSLayer;
//Duplicates the layer and insert the copy above itself


//exportstuff //nottested
function isLayerExportable():Bool;
function shouldIncludeLayerInSlice(arg1:Dynamic):Bool;

//undocumented 
public function path():Path;
public function hash():Dynamic;
public function rectByAccountingForStyleSize(rect:CGRect):CGRect;
public function removeFromParent():Void;

public function parentOrSelfIsSymbol():Bool;
public function containsSymbols():Bool;

// inline public function _class():String{
//     return untyped __js__("_this.class()");
// }
public function layers():SketchArray<MSLayer>;

/*
// not working
public function setFixedRadius(r:Int):Void;
public function fixedRadius():Int;
*/




//untested
public function isMemberOfClass(c:Class<Dynamic>):Bool;

//experimental
//tested
public function CSSAttributeString():String;//unquaoted
function CSSAttributes():Dynamic; //quoted

function children():SketchArray<MSLayer>;//(id)
function ancestors():SketchArray<MSLayer>;//(id)
//- (void)select:(BOOL)arg1 byExpandingSelection:(BOOL)arg2;
inline function select(ok:Bool,byExpandingSelection:Bool):Void{
    return untyped select_byExpandingSelection(ok,byExpandingSelection);
}

function multiplyBy(v:Float):Void;//(void)
//exists but no comprendo
function svgStyle():MSStyle;
function isHovering():Bool;
function   canBeTransformed():Bool;
function   calculateHasBlendedLayer():Bool;


function assignWithOriginalLinkedStyleIfNecessary():Dynamic;
function minimumSize():CGSize;//(struct CGSize)
function layerSizeDidChange():Dynamic;//(void)



//mask stuff
function isPartOfClippingMask():Bool;//(BOOL)
function hasClippingMask():Bool;
function setHasClippingMask(b:Bool):Void;




function clearPositionCachesIncludingLocalCaches(arg:Bool):Void;//(void)
function clearPositionCaches():Void;//(void)
function concatAncestorTransforms():Void;//(void)
function calculateAncestorTransforms():Dynamic;//(id)
function ancestorTransforms():Dynamic;//(id)
function transform():Dynamic;//(id)
function transformForRect(arg:CGRect):Dynamic;//(id)



function convertRectToAbsoluteCoordinates(arg: CGRect):CGRect;//(struct CGRect)
function convertPointToLayerCoordinates(arg:CGPoint):CGPoint;//(struct CGPoint)
function convertPointToAbsoluteCoordinates(arg:CGPoint):CGPoint;//(struct CGPoint)
function convertPointToViewCoordinates(arg:CGPoint):CGPoint;//(struct CGPoint)
//nottested

function upgradeShapes():Dynamic;//(void)
//function markLayerAsChangedPassingTest(arg1:Dynamic):Dynamic:(;//(void) pas l'ai pour nous ça 
function closestClippingLayer():Dynamic;//(id)
function inspectorViewControllers():Dynamic;//(id)
function inspectorViewControllerNames():Dynamic;//(id)
function parentArtboard():MSArtboardGroup;//(id)
function parentRoot():Dynamic;//(id) //Artboard
function currentPage():MSPage;//(id)
function parentPage():MSPage;//(id)
function changeColor(v:Dynamic):Void;
}


/*
//     SKETCH3
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "_MSLayer.h"

#import "NSCoding.h"
#import "NSCopying.h"

@class GKRect, MSAbsoluteRect, NSAffineTransform, NSArray, NSBitmapImageRep;

@interface MSLayer : _MSLayer <NSCoding, NSCopying>
{
    long long skipDrawingSelectionCounter;
    struct CGRect relativeRect;
    GKRect *frameAtMouseDown;
    BOOL _isHovering;
    BOOL _isAlreadyCaching;
    BOOL _isSelected;
    long long _layerListExpandedType;
    MSAbsoluteRect *_absoluteRect;
    NSAffineTransform *_cachedTransform;
    NSArray *_cachedAncestorTransforms;
    id _undoRefreshTimer;
    struct CGRect _lightweightAbsoluteRect;
    struct CGRect _cachedDirtyRectForBounds;
}

+ (void)hideSelectionDisabledInBlock:(CDUnknownBlockType)arg1;
+ (void)makeLayerNamesUnique:(id)arg1 withTest:(CDUnknownBlockType)arg2;
+ (void)makeLayerNamesUnique:(id)arg1;
+ (id)layersSeparatedByGroups:(id)arg1;
@property(nonatomic) struct CGRect cachedDirtyRectForBounds; // @synthesize cachedDirtyRectForBounds=_cachedDirtyRectForBounds;
@property(retain, nonatomic) id undoRefreshTimer; // @synthesize undoRefreshTimer=_undoRefreshTimer;
@property(retain, nonatomic) NSArray *cachedAncestorTransforms; // @synthesize cachedAncestorTransforms=_cachedAncestorTransforms;
@property(retain, nonatomic) NSAffineTransform *cachedTransform; // @synthesize cachedTransform=_cachedTransform;
@property(retain, nonatomic) MSAbsoluteRect *absoluteRect; // @synthesize absoluteRect=_absoluteRect;
@property(nonatomic) struct CGRect lightweightAbsoluteRect; // @synthesize lightweightAbsoluteRect=_lightweightAbsoluteRect;
@property(nonatomic) BOOL isSelected; // @synthesize isSelected=_isSelected;
@property(nonatomic) long long layerListExpandedType; // @synthesize layerListExpandedType=_layerListExpandedType;
@property(nonatomic) BOOL isAlreadyCaching; // @synthesize isAlreadyCaching=_isAlreadyCaching;
@property(nonatomic) BOOL isHovering; // @synthesize isHovering=_isHovering;
- (void).cxx_destruct;
- (void)groupDidRemoveThisLayer:(id)arg1;
- (void)groupDidAddThisLayer:(id)arg1;
- (BOOL)canRotate;
- (BOOL)isFrameEqualForSync:(id)arg1;
- (BOOL)containsSymbols;
- (BOOL)parentOrSelfIsSymbol;
- #(BOOL)isLayerExportable;
- (BOOL)isValidChild:(id)arg1;
- (void)assignWithOriginalLinkedStyleIfNecessary;
- (id)layerWithId:(id)arg1;
- (BOOL)shouldRenderInTransparencyLayer;
- (BOOL)shouldForceRendering;
@property(copy, nonatomic) GKRect *frameInArtboard; // @dynamic frameInArtboard;
- (BOOL)calculateHasBlendedLayer;
- (id)currentHandlerKey;
- (BOOL)shouldBeSelectedInLayerList;
- (BOOL)canBeSelectedOnCanvas;
- (void)setValue:(id)arg1 forUndefinedKey:(id)arg2;
- (void)setNilValueForKey:(id)arg1;
- (BOOL)canBeTransformed;
- (void)setRotation:(double)arg1;
- (void)setIsFlippedVertical:(BOOL)arg1;
- (void)setIsFlippedHorizontal:(BOOL)arg1;
- (struct CGSize)minimumSize;
- (void)layerSizeDidChangeFromCorner:(long long)arg1;
- (void)multiplyBy:(double)arg1;
- (BOOL)isPartOfClippingMask;
- (void)clearPositionCachesIncludingLocalCaches:(BOOL)arg1;
- (void)clearPositionCaches;
- (void)concatAncestorTransforms;
- (id)calculateAncestorTransforms;
- (id)ancestorTransforms;
- (id)transform;
- (id)transformForRect:(struct CGRect)arg1;
- (struct _CHTransformStruct)transformStruct;
- (struct CGRect)convertRectToAbsoluteCoordinates:(struct CGRect)arg1;
- (struct CGPoint)convertPointToLayerCoordinates:(struct CGPoint)arg1;
- (struct CGPoint)convertPointToAbsoluteCoordinates:(struct CGPoint)arg1;
- (struct CGPoint)convertPointToViewCoordinates:(struct CGPoint)arg1;
- (id)children;
- (id)ancestors;
- (void)upgradeShapes;
- (void)markLayerAsChangedPassingTest:(CDUnknownBlockType)arg1;
- (id)closestClippingLayer;
- (id)inspectorViewControllers;
- (id)inspectorViewControllerNames;
- (id)parentArtboard;
- (id)parentRoot;
- (id)currentPage;
- (id)parentPage;
- (BOOL)shouldDrawArtisticStrokeForPath:(id)arg1;
- (BOOL)hasClippingMask;
- (BOOL)handleDoubleClick;
- (void)removeFromParent;
- (void)handleLightweightObjectChangeForKey:(id)arg1 sender:(id)arg2;
- (BOOL)isUndoingModelObjectChange;
- (void)refreshForPropertyChanged:(id)arg1;
- (void)propertyDidChange:(id)arg1;
- (void)rectDidChange;
- (void)rectWillChange;
- (void)moveInLayerTreeInBlock:(CDUnknownBlockType)arg1;
- (void)changeColor:(id)arg1;
- (BOOL)closePath;
- (id)bezierPathWithTransforms;
- (id)bezierPath;
- (id)handlerName;
- (struct CGRect)rectForBitmapCaching;
- (id)absoluteDirtyRect;
- (struct CGRect)affectedFrameOfLayer;
- (struct CGRect)baseRectByAccountingForStyleSize:(struct CGRect)arg1;
- (struct CGRect)rectByAccountingForStyleSize:(struct CGRect)arg1;
- (struct CGRect)dirtyRectForRect:(struct CGRect)arg1;
- (struct CGRect)dirtyRectForBounds;
- (struct CGRect)dirtyRectForFrame;
- (void)refreshViewsWithMask:(unsigned long long)arg1;
- (void)refreshOfType:(unsigned long long)arg1 rect:(struct CGRect)arg2;
- (struct CGRect)translateRectFromBoundsToFrame:(struct CGRect)arg1;
- (void)markLayerDirtyOfType:(unsigned long long)arg1 margins:(struct CGSize)arg2;
- (void)markLayerDirtyOfType:(unsigned long long)arg1;
- (void)layerDidChange;
@property(retain, nonatomic) NSBitmapImageRep *cachedImage; // @dynamic cachedImage;
- (BOOL)hitTest:(struct CGPoint)arg1;
- (BOOL)isTooSmallForHitTesting;
- (long long)selectedCorner:(struct CGPoint)arg1 zoom:(double)arg2;
- (void)select:(BOOL)arg1 byExpandingSelection:(BOOL)arg2 showSelection:(BOOL)arg3;
- (void)select:(BOOL)arg1 byExpandingSelection:(BOOL)arg2;
- (BOOL)containsSelectedItem;
- (void)recordRelativeRect;
- (void)resetRelativeRect;
- (struct CGRect)relativeRect;
- (void)setFrameAtMouseDown:(id)arg1;
- (struct CGRect)boundsRect;
- (id)bounds;
- (id)frameAtMouseDown;
- (void)enableSelectionDelayedAndRelease;
- (void)hideSelectionTemporarily;
- (void)showSelectionImmediately;
- (id)valueForUndefinedKey:(id)arg1;
@property(nonatomic) double proportions; // @dynamic proportions;
@property(nonatomic) BOOL constrainProportions; // @dynamic constrainProportions;
- (id)bezierPathForHover;
- (id)colorForHover;
- (void)drawHoverWithZoom:(double)arg1;
- (unsigned long long)selectionCornerMask;
- (BOOL)canOneClickEditLayer;
- (BOOL)shouldDrawSelection;
- (struct CGRect)frameForTransforms;
- (void)recordFrame;
- (double)zoomValue;
- (id)renderBitmapEffects:(id)arg1;
- (BOOL)hasActiveBackgroundBlur;
- (BOOL)hasBitmapStylesEnabled;
- (void)prepareObjectCopy:(id)arg1;
- (id)duplicate;
#- (id)layersSharingStyle:(id)arg1;
- (id)findUniqueName;
- (id)layersNamedAlikeWithTest:(CDUnknownBlockType)arg1;
- (void)makeNameUniqueWithTest:(CDUnknownBlockType)arg1;
- (void)makeNameUnique;
- (id)defaultName;
- (void)setFrame:(id)arg1;
- (id)objectIDsForSelfAncestorsAndChildren;
#- (id)defaultStyle;
- (id)initWithFrame:(struct CGRect)arg1;
- (void)objectDidInit;
- (void)initEmptyObject;
#- (id)CSSAttributes;
#- (id)CSSRotation;
#- (id)CSSAttributeString;
- (BOOL)isExpandedInLayerList;
- (id)previewFillColor:(BOOL)arg1;
- (id)previewBorderColor:(BOOL)arg1;
- (void)drawPreviewInRect:(struct CGRect)arg1 honourSelected:(BOOL)arg2;
#- (void)writeBitmapImageToFile:(id)arg1;
- (Class)rendererClass;
- (void)migratePropertiesFromV33OrEarlierWithCoder:(id)arg1;
- (unsigned long long)decodingConversionForProperty:(id)arg1;
- (void)initLegacyWithCoder:(id)arg1;
#- (void)writeSVGToElement:(id)arg1 withExporter:(id)arg2;
- (void)appendBaseTranslation:(id)arg1 exporter:(id)arg2;
#- (id)relativeRectWithExporter:(id)arg1;
- (struct CGPoint)layerOffsetWithExporter:(id)arg1;
#- (void)addSVGAttributes:(id)arg1 forExporter:(id)arg2;
#- (id)svgStyle;
- (void)addGradientsToDocument:(id)arg1;
- (void)addChildrenToElement:(id)arg1 exporter:(id)arg2;
- (id)addContentToElement:(id)arg1 attributes:(id)arg2 exporter:(id)arg3 action:(unsigned long long *)arg4;
#- (BOOL)shouldIncludeLayerInSlice:(id)arg1;
#- (BOOL)intersectsSlice:(id)arg1;

@end

*/
