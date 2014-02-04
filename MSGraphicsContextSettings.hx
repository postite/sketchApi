extern class MSGraphicsContextSettings{
//This class holds Opacity and Blending for its associated layer or style. Each layer fill also has a contextsettings such that we can very opacity between fills.


public function setOpacity(o:Float):Void;
public function opacity():Float;
//A float between 0 and 1
public function setBlendMode(b:Int):Void;
public function blendMode():Int;
//The blending mode for the layer or fill. See the list below for possible values

// 0:  Normal;
// 1:  Darken;
// 2:  Multiply;
// 3:  Color Burn;
// 4:  Lighten;
// 5:  Screen;
// 6:  Color Dodge;
// 7:  Overlay;
// 8:  Soft Light;
// 9:  Hard Light;
// 10: Difference;
// 11: Exclusion;
// 12: Hue;
// 13: Saturation;
// 14: Color;
// 15: Luminosity;
// 16: Source In;
// 17: Source Out;
// 18: Source Atop;
// 19: Destination Over;
// 20: Destination In;
// 21: Destination Out;
// 22: Destination Atop;
}

/*

@interface _MSGraphicsContextSettings : MSModelObject
{
    long long _blendMode;
    double _opacity;
}

@property(nonatomic) double opacity; // @synthesize opacity=_opacity;
@property(nonatomic) long long blendMode; // @synthesize blendMode=_blendMode;
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
- (void)setPrimitiveOpacity:(double)arg1;
- (double)primitiveOpacity;
- (void)setPrimitiveBlendMode:(long long)arg1;
- (long long)primitiveBlendMode;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end

*/