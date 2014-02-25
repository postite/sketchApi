extern class MSShapeGroup extends MSLayer{

public function setHasClippingMask(b:Bool):Void;

}

/*

@interface MSShapeGroup : _MSShapeGroup
{
    BOOL skipNextArtisticStroke;
    int ignoreInvalidChildCounter;
    BOOL _textRenderedOnPath;
}

+ (BOOL)groupBoundsShouldBeIntegral;
+ (id)shapeWithBezierPath:(id)arg1;
@property(nonatomic) BOOL textRenderedOnPath; // @synthesize textRenderedOnPath=_textRenderedOnPath;
@property(nonatomic) BOOL skipNextArtisticStroke; // @synthesize skipNextArtisticStroke;
- (void)adjustStyleToFitSubPaths;
- (BOOL)shouldForceRendering;
- (BOOL)shouldBeSelectedInLayerList;
- (id)allCurvePoints;
- (void)debugWritePaths:(long long)arg1;
- (BOOL)isVerticalLine;
- (BOOL)isHorizontalLine;
- (void)makeLinePixelAligned;
- (BOOL)isLine;
- (void)drawHoverWithZoom:(double)arg1;
- (id)alternativePathForShadowWithRadius:(double)arg1;
- (void)layerStyleDidChange;
- (void)layerSizeDidChange;
- (void)invalidateCache;
- (void)handleLightweightObjectChangeForKey:(id)arg1 sender:(id)arg2;
- (BOOL)isPartOfClippingMask;
- (void)moveTransformsToChildren;
- (void)reversePath;
- (void)simplify;
- (BOOL)shouldDrawArtisticStrokeForPath:(id)arg1;
@property(nonatomic) BOOL isClosed; // @dynamic isClosed;
- (void)setEdited:(BOOL)arg1;
- (id)inspectorViewControllers;
- (void)setHasClippingMask:(BOOL)arg1;
- (struct CGRect)affectedFrameOfLayer;
- (id)textOnShape;
- (BOOL)isValidChild:(id)arg1;
- (void)ignoreInvalidChildDuringBlock:(CDUnknownBlockType)arg1;
- (void)setBezierPath:(id)arg1;
- (id)decoratedBezierPatInAbsoluteFrame:(struct CGRect)arg1;
- (id)outlineStrokePath:(id)arg1;
- (id)decoratedBezierPath;
- (id)bezierPathOfSubPath:(id)arg1 inRect:(struct CGRect)arg2;
- (id)bezierPathInRect:(struct CGRect)arg1;
- (id)_bezierPathInSize:(struct CGSize)arg1;
- (void)applyPropertiesToBezier:(id)arg1;
- (id)bezierPath;
- (id)bezierPathWithTransforms;
- (struct CGRect)rectByAccountingForStyleSize:(struct CGRect)arg1;
- (BOOL)hitTestAsLine:(struct CGPoint)arg1;
- (BOOL)hitTest:(struct CGPoint)arg1;
- (id)handlerName;
- (BOOL)handleDoubleClick;
- (id)defaultName;
- (void)resizeRoot;
- (long long)selectedCorner:(struct CGPoint)arg1 zoom:(double)arg2;
- (void)fillInEmptyObjects;
- (void)initObjectWithCoder:(id)arg1;
- (void)initEmptyObject;
- (id)CSSAttributes;
- (id)CSSAttributeString;
- (id)bezierLinePreviewInRect:(struct CGRect)arg1;
- (void)drawLinePreviewInRect:(struct CGRect)arg1 honourSelected:(BOOL)arg2;
- (void)drawPreviewInRect:(struct CGRect)arg1 honourSelected:(BOOL)arg2;
- (id)lastPoint;
- (id)firstPoint;
- (struct CGPoint)rulerBase;
@property(nonatomic) double length; // @dynamic length;
@property(nonatomic) double y2; // @dynamic y2;
@property(nonatomic) double x2; // @dynamic x2;
@property(nonatomic) double y1; // @dynamic y1;
@property(nonatomic) double x1; // @dynamic x1;
- (void)setP2:(struct CGPoint)arg1;
- (void)setP1:(struct CGPoint)arg1;
- (struct CGPoint)p2;
- (struct CGPoint)p1;
- (id)addContentToElement:(id)arg1 attributes:(id)arg2 exporter:(id)arg3 action:(unsigned long long *)arg4;
- (id)elementNameWithAttributes:(id)arg1 path:(id *)arg2 pathAttributes:(id *)arg3 elementAttributes:(id *)arg4 exportAsPath:(char *)arg5 exporter:(id)arg6;
- (id)addMaskWithElement:(id)arg1 parentElement:(id)arg2 attributes:(id)arg3 exporter:(id)arg4;
- (void)appendBaseTranslation:(id)arg1 exporter:(id)arg2;
- (id)svgStyle;
- (Class)rendererClass;
- (unsigned long long)decodingConversionForProperty:(id)arg1;
- (void)initLegacyWithCoder:(id)arg1;

@end

*/