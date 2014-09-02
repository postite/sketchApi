
//@see http://www.gnustep.org/resources/OpenStepSpec/ApplicationKit/Classes/NSText.html
extern class MSTextLayer extends MSLayer{

//Represents text. Subclass of MSLayer Only the most basic of properties have yet been exposed.

public function fontSize():Int;
//public function font():Dynamic; // not readable

public function fontPostscriptName():String;
//public function textColor():MSColor;
public function textAlignment():Dynamic;
public function characterSpacing():Int;
public function lineSpacing():Float; //yes it can be a Float



public function textColor():MSColor;

//undocumented
//public function textColor():Color;

public function stringValue():String;
public function setStringValue(s:String):Void;

//untested
public function setFont(f:String):Void;
public function setFontPostscriptName(f:String):Void;

}

/*
--------- Sketch3 --------
#import "_MSTextLayer.h"

#import "NSTextStorageDelegate.h"

@class BCTextBehaviour, MSColor, NSBezierPath, NSDictionary, NSLayoutManager, NSString, NSTextContainer, NSTextStorage, NSTextView;

@interface MSTextLayer : _MSTextLayer <NSTextStorageDelegate>
{
    NSLayoutManager *layout;
    NSTextContainer *container;
    BOOL isEditingText;
    int ignoreDelegateNotificationsCounter;
    long long heightBeforeResizing;
    NSTextStorage *storageBeforeDragging;
    NSBezierPath *cachedBezierRepresentation;
    struct CGRect previousRectCache;
    BOOL _ignoreNextTextProcessingUpdate;
    NSTextView *_textView;
    id <MSTextLayerEditingDelegate> _editingDelegate;
    NSBezierPath *_lightweightFirstUnderlyingShapePath;
    double _lightweightFontSize;
    BCTextBehaviour *_behaviour;
}

@property(retain, nonatomic) BCTextBehaviour *behaviour; // @synthesize behaviour=_behaviour;
@property(nonatomic) double lightweightFontSize; // @synthesize lightweightFontSize=_lightweightFontSize;
@property(retain, nonatomic) NSBezierPath *lightweightFirstUnderlyingShapePath; // @synthesize lightweightFirstUnderlyingShapePath=_lightweightFirstUnderlyingShapePath;
@property(nonatomic) id <MSTextLayerEditingDelegate> editingDelegate; // @synthesize editingDelegate=_editingDelegate;
@property(nonatomic) NSTextView *textView; // @synthesize textView=_textView;
@property(nonatomic) BOOL ignoreNextTextProcessingUpdate; // @synthesize ignoreNextTextProcessingUpdate=_ignoreNextTextProcessingUpdate;
@property(readonly, nonatomic) long long heightBeforeResizing; // @synthesize heightBeforeResizing;
@property(copy, nonatomic) NSTextStorage *storageBeforeDragging; // @synthesize storageBeforeDragging;
@property(nonatomic) struct CGRect previousRectCache; // @synthesize previousRectCache;
@property(retain, nonatomic) NSBezierPath *cachedBezierRepresentation; // @synthesize cachedBezierRepresentation;
- (void).cxx_destruct;
- (struct CGRect)calculateTextBounds:(struct CGRect)arg1 includeZoom:(BOOL)arg2;
- (BOOL)constrainProportions;
- (id)usedFontNames;
- (void)drawHoverWithZoom:(double)arg1;
- (void)resizeToFitNewWidthComingFrom:(double)arg1;
- (void)resizeTextToFitNewHeight:(long long)arg1;
- (void)replaceTextStorageTextBy:(id)arg1;
- (void)makeLowercase:(id)arg1;
- (void)makeUppercase:(id)arg1;
- (void)multiplyBy:(double)arg1;
- (id)attributeForKey:(id)arg1;
- (void)addAttribute:(id)arg1 value:(id)arg2;
- (void)addAttributes:(id)arg1 forRange:(struct _NSRange)arg2;
- (void)setAttributes:(id)arg1 forRange:(struct _NSRange)arg2;
- (void)addAttribute:(id)arg1 value:(id)arg2 forRange:(struct _NSRange)arg3;
- (void)ignoreDelegateNotificationsInBlock:(CDUnknownBlockType)arg1;
- (id)inspectorViewControllerNames;
@property(copy, nonatomic) NSString *stringValue; // @dynamic stringValue;
- (BOOL)isFrameEqualForSync:(id)arg1;
- (BOOL)textStorageIsEqual:(id)arg1;
- (void)syncTextStorageTo:(id)arg1;
- (void)copyTextStorageTo:(id)arg1;
- (void)prepareObjectCopy:(id)arg1;
- (void)layerStyleDidChange;
- (BOOL)isEmpty;
- (BOOL)shouldUseCachedBezierRepresentation;
- (void)changeColor:(id)arg1;
@property(copy, nonatomic) NSDictionary *styleAttributes; // @dynamic styleAttributes;
- (void)setNilValueForKey:(id)arg1;
@property(copy, nonatomic) MSColor *textColor; // @dynamic textColor;
@property(nonatomic) double lineSpacing; // @dynamic lineSpacing;
- (double)baseLineHeight;
@property(nonatomic) double characterSpacing; // @dynamic characterSpacing;
@property(retain, nonatomic) NSString *fontPostscriptName; // @dynamic fontPostscriptName;
- (void)setFont:(id)arg1;
@property(nonatomic) double fontSize; // @dynamic fontSize;
- (void)changeTextColorTo:(id)arg1;
@property(nonatomic) unsigned long long textAlignment; // @dynamic textAlignment;
- (void)setLeading:(double)arg1;
- (double)leading;
- (id)paragraphStyle;
- (void)setKerning:(float)arg1;
- (float)kerning;
- (struct CGRect)dirtyRectForBounds;
- (void)markLayerDirtyOfType:(unsigned long long)arg1;
- (void)recordRelativeRect;
- (id)_bezierPathInBounds;
- (id)_bezierPath;
- (id)bezierPath;
- (id)bezierPathWithTransforms;
- (double)startingPositionOnPath:(id)arg1;
- (double)defaultLineHeight;
- (id)font;
- (void)changeFont:(id)arg1;
- (id)handlerName;
- (BOOL)shouldDrawSelection;
- (unsigned long long)selectionCornerMask;
- (struct CGRect)affectedFrameOfLayer;
- (id)layoutManager;
- (id)firstUnderlyingShape;
- (void)setIsEditingText:(BOOL)arg1;
- (BOOL)isEditingText;
- (void)prepareForUndo;
- (void)setStorageContentsWithUndo:(id)arg1;
- (id)container;
- (void)adjustFrameToFit;
- (void)finishEditing;
- (double)anchorForBehaviour;
- (void)startEditing;
- (void)adjustTextViewFrame;
- (void)refreshForPropertyChanged:(id)arg1;
- (void)textStorageDidProcessEditing:(id)arg1;
- (void)syncTextStyleAttributes;
- (id)createTextContainer;
- (id)createLayoutManager;
- (void)recreateTextObjects;
- (void)setUpText;
- (void)rectWidthDidChange:(id)arg1;
- (void)layerSizeDidChangeFromCorner:(long long)arg1;
- (void)setContainerSize:(struct CGSize)arg1;
- (void)adjustContainerWidthTo:(double)arg1;
- (void)setupBehaviour:(BOOL)arg1;
- (void)setTextBehaviour:(long long)arg1;
- (id)defaultName;
- (id)stringByStrippingMarkers:(id)arg1 oldList:(id)arg2 index:(long long)arg3;
- (id)stringByStrippingNewlinesSpacesAndTabs:(id)arg1;
- (id)stripAttributedStringLineFromListMarkers:(id)arg1 oldList:(id)arg2 lineIndex:(long long)arg3;
- (id)strippedLinesFromTextStorage:(id)arg1 oldList:(id)arg2;
- (id)combineLines:(id)arg1 intoList:(id)arg2;
- (id)normalTabStops;
- (id)listTabStops;
- (void)updateListFrom:(id)arg1 toList:(id)arg2;
- (void)updateListStyle:(id)arg1;
- (id)currentListStyle;
- (void)setStyle:(id)arg1;
- (void)initObjectWithCoder:(id)arg1;
- (void)objectDidInit;
- (void)initEmptyObject;
- (id)initWithFrame:(struct CGRect)arg1 attributes:(id)arg2 type:(long long)arg3;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)CSSAttributes;
- (void)drawPreviewInRect:(struct CGRect)arg1 honourSelected:(BOOL)arg2;
- (Class)rendererClass;
- (BOOL)shouldRenderInTransparencyLayer;
- (unsigned long long)decodingConversionForProperty:(id)arg1;
- (void)migratePropertiesFromV30OrEarlierWithCoder:(id)arg1;
- (void)migratePropertiesFromV34OrEarlierWithCoder:(id)arg1;
- (void)initLegacyWithCoder:(id)arg1;
- (id)addContentToElement:(id)arg1 attributes:(id)arg2 exporter:(id)arg3 action:(unsigned long long *)arg4;
- (id)elementForSpan:(id)arg1 origin:(struct CGPoint)arg2 exporter:(id)arg3 text:(id)arg4;
- (id)spanInfoForRun:(struct _NSRange)arg1 charAttributes:(id)arg2 text:(id)arg3;
- (void)addSVGAttributes:(id)arg1 forCharacterAttributes:(id)arg2 forExporter:(id)arg3 origin:(struct CGPoint *)arg4;
- (void)appendBaseTranslation:(id)arg1 exporter:(id)arg2;
- (id)svgStyle;

@end

*/