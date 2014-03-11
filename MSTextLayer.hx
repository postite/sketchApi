
//@see http://www.gnustep.org/resources/OpenStepSpec/ApplicationKit/Classes/NSText.html
extern class MSTextLayer extends MSLayer{

//Represents text. Subclass of MSLayer Only the most basic of properties have yet been exposed.

public function fontSize():Int;
//public function font():Dynamic; // not readable

public function fontPostscriptName():String;
//public function textColor():MSColor;
public function textAlignment():Dynamic;
public function characterSpacing():Int;
public function lineSpacing():Int;

//undocumented
//public function textColor():Color;

public function stringValue():String;

//untested
public function setFont(f:String):Void;
public function setFontPostscriptName(f:String):Void;

}

/*
@interface _MSTextLayer : MSStyledLayer
{
    BOOL _automaticallyDrawOnUnderlyingPath;
    NSTextStorage *_storage;
    long long _textBehaviour;
}

@property(nonatomic) long long textBehaviour; // @synthesize textBehaviour=_textBehaviour;
@property(retain, nonatomic) NSTextStorage *storage; // @synthesize storage=_storage;
@property(nonatomic) BOOL automaticallyDrawOnUnderlyingPath; // @synthesize automaticallyDrawOnUnderlyingPath=_automaticallyDrawOnUnderlyingPath;
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
- (void)setPrimitiveTextBehaviour:(long long)arg1;
- (long long)primitiveTextBehaviour;
- (void)setPrimitiveStorage:(id)arg1;
- (id)primitiveStorage;
- (void)setPrimitiveAutomaticallyDrawOnUnderlyingPath:(BOOL)arg1;
- (BOOL)primitiveAutomaticallyDrawOnUnderlyingPath;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end



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
    BCTextBehaviour *_behaviour;
}

@property(retain, nonatomic) BCTextBehaviour *behaviour; // @synthesize behaviour=_behaviour;
@property(retain, nonatomic) NSBezierPath *lightweightFirstUnderlyingShapePath; // @synthesize lightweightFirstUnderlyingShapePath=_lightweightFirstUnderlyingShapePath;
@property(nonatomic) id <MSTextLayerEditingDelegate> editingDelegate; // @synthesize editingDelegate=_editingDelegate;
@property(nonatomic) NSTextView *textView; // @synthesize textView=_textView;
@property BOOL ignoreNextTextProcessingUpdate; // @synthesize ignoreNextTextProcessingUpdate=_ignoreNextTextProcessingUpdate;
@property(readonly) long long heightBeforeResizing; // @synthesize heightBeforeResizing;
@property(copy) NSTextStorage *storageBeforeDragging; // @synthesize storageBeforeDragging;
@property struct CGRect previousRectCache; // @synthesize previousRectCache;
@property(retain, nonatomic) NSBezierPath *cachedBezierRepresentation; // @synthesize cachedBezierRepresentation;
- (void).cxx_destruct;
- (struct CGRect)calculateTextBounds:(struct CGRect)arg1 includeZoom:(BOOL)arg2;
- (void)dealloc;
- (void)encodeWithCoder:(id)arg1;
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
- (void)copyTextStorageTo:(id)arg1;
- (void)prepareObjectCopy:(id)arg1;
- (id)currentStyle;
- (id)textStyles;
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
- (void)markLayerDirtyOfType:(unsigned long long)arg1 margins:(struct CGSize)arg2;
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
- (id)createTextContainer;
- (id)createLayoutManager;
- (void)recreateTextObjects;
- (void)setUpText;
- (void)rectWidthDidChange:(id)arg1;
- (void)layerSizeDidChange;
- (void)setContainerSize:(struct CGSize)arg1;
- (void)adjustContainerWidthTo:(double)arg1;
- (void)setupBehaviour;
- (void)setTextBehaviour:(long long)arg1;
- (id)defaultName;
- (void)initObjectWithCoder:(id)arg1;
- (void)objectDidInit;
- (void)initEmptyObject;
- (id)initWithFrame:(struct CGRect)arg1 attributes:(id)arg2 type:(long long)arg3;
- (id)initWithFrame:(struct CGRect)arg1;
- (id)CSSAttributes;
- (void)drawPreviewInRect:(struct CGRect)arg1 honourSelected:(BOOL)arg2;
- (id)addContentToElement:(id)arg1 attributes:(id)arg2 exporter:(id)arg3 action:(unsigned long long *)arg4;
- (id)elementForRun:(struct _NSRange)arg1 charAttributes:(id)arg2 origin:(struct CGPoint)arg3 exporter:(id)arg4 text:(id)arg5;
- (void)addSVGAttributes:(id)arg1 forCharacterAttributes:(id)arg2 forExporter:(id)arg3 origin:(struct CGPoint *)arg4;
- (void)appendBaseTranslation:(id)arg1 exporter:(id)arg2;
- (id)svgStyle;
- (Class)rendererClass;
- (unsigned long long)decodingConversionForProperty:(id)arg1;
- (void)initLegacyWithCoder:(id)arg1;

@end

*/