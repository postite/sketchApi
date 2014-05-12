import MSStyle.MSGradient;
import ns.NSImage;
extern class MSStyleFill extends MSStyleBasicFill{
public function fillType():Int;
//A color fill (0), gradient (1) or pattern (4). Other values make no sense and can lead to unpredictable behaviour

override public function gradient():MSGradient;
//An MSGradient object that will only be used if the fillType is set to a gradient.

public function patternImage():NSImage;
//An NSImage object that will be used if the fillType is set to pattern
public function setPatternImage(image:NSImage):Void;

public function noiseIntensity():Float;
//A float representing the intensity of the noise from 0..1

public function isEnabled():Bool;
//Whether the style object is enabled or not


//undoc
public function setFillType(v:Int):Void;
override public function color():MSColor;
override public function setColor(col:MSColor):Void;



}

/*
SKETCH 3
#import "_MSStyleFill.h"

@interface MSStyleFill : _MSStyleFill
{
    double _lightweightParentLayerCachedOpacity;
}

+ (id)defaultFillColor;
@property(nonatomic) double lightweightParentLayerCachedOpacity; // @synthesize lightweightParentLayerCachedOpacity=_lightweightParentLayerCachedOpacity;
- (BOOL)hasOpacity;
- (id)initWithCoder:(id)arg1;
- (void)setPatternTileScale:(double)arg1;
- (void)setPatternImage:(id)arg1;
- (id)defaultName;
- (void)initEmptyObject;
- (id)CSSAttributeString;
- (id)transformDecodedObjectIfNecessary:(id)arg1 key:(id)arg2;
- (void)addSVGAttributes:(id)arg1 forExporter:(id)arg2;

@end

*/