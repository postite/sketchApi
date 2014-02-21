import MSStyle.MSGradient;
import MSStyle.NSImage;
extern class MSStyleFill extends MSStyleBasicFill{
public function fillType():Int;
//A color fill (0), gradient (1) or pattern (4). Other values make no sense and can lead to unpredictable behaviour

override public function gradient():MSGradient;
//An MSGradient object that will only be used if the fillType is set to a gradient.

public function patternImage():NSImage;
//An NSImage object that will be used if the fillType is set to pattern

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
@interface _MSStyleFill : MSStyleBasicFill
{
    double _noiseIntensity;
    long long _patternFillType;
    NSImage *_patternImage;
    double _patternTileScale;
}

@property(nonatomic) double patternTileScale; // @synthesize patternTileScale=_patternTileScale;
@property(retain, nonatomic) NSImage *patternImage; // @synthesize patternImage=_patternImage;
@property(nonatomic) long long patternFillType; // @synthesize patternFillType=_patternFillType;
@property(nonatomic) double noiseIntensity; // @synthesize noiseIntensity=_noiseIntensity;
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
- (void)setPrimitivePatternTileScale:(double)arg1;
- (double)primitivePatternTileScale;
- (void)setPrimitivePatternImage:(id)arg1;
- (id)primitivePatternImage;
- (void)setPrimitivePatternFillType:(long long)arg1;
- (long long)primitivePatternFillType;
- (void)setPrimitiveNoiseIntensity:(double)arg1;
- (double)primitiveNoiseIntensity;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end

*/