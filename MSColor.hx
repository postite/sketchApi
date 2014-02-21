typedef UIColor=Dynamic
extern class MSColor{

	public function hue():Float;
	public function saturation():Float;
	public function brightness():Float;
	public inline static function colorWithHex(d:String,?_alpha:Float=1):MSColor{
		return untyped MSColor.colorWithHex_alpha(d,_alpha);
	}
	public  static function colorWithNSColor(d:NSColor):MSColor;

	public inline static function colorWithHue(_hue:Float,_saturation:Float,_brightness:Float,?_alpha:Float=1):MSColor
	{
		return untyped MSColor.colorWithHue_saturation_brightness_alpha(_hue,_saturation,_brightness,_alpha);
	}

	public static function screenColorSpace():Dynamic;
	
	public function hexValue():String;
	public function alpha():Float; //0>1
	
	
}


/*

@interface MSColor : _MSColor
{
}

+ (void)getRed:(double *)arg1 green:(double *)arg2 blue:(double *)arg3 fromHexValue:(id)arg4;
+ (id)colorWithHex:(id)arg1 alpha:(double)arg2;
+ (id)hexValueForRed:(double)arg1 green:(double)arg2 blue:(double)arg3;
+ (id)exportingColorSpace;
+ (id)screenColorSpace;
+ (id)colorWithNSColor:(id)arg1;
+ (id)colorWithLegacyNSColor:(id)arg1;
+ (id)availableRGBColorSpaces;
+ (id)colorWithHue:(double)arg1 saturation:(double)arg2 brightness:(double)arg3 alpha:(double)arg4;
+ (id)colorWithRed:(double)arg1 green:(double)arg2 blue:(double)arg3 alpha:(double)arg4;
+ (void)setForcedColorSpace:(id)arg1;
+ (id)colorWithRGBADictionary:(id)arg1;
+ (id)colorFromSVGColor:(id)arg1;
+ (id)colorWithSVGString:(id)arg1;
- (BOOL)isBlack;
- (BOOL)isWhite;
- (BOOL)fuzzyIsEqual:(id)arg1;
- (id)stringValueWithAlpha:(BOOL)arg1 alphaMultiplication:(double)arg2;
- (id)stringValueWithAlpha:(BOOL)arg1;
- (id)hexValue;
@property(readonly, nonatomic) double brightness; // @dynamic brightness;
@property(readonly, nonatomic) double saturation; // @dynamic saturation;
@property(readonly, nonatomic) double hue; // @dynamic hue;
- (id)HSBColor;
- (id)description;
- (void)setNSColor:(id)arg1;
- (id)NSColorWithColorSpace:(id)arg1;
- (id)NSColorWithUglyHack;
- (id)NSColorUsingCurrentContext;
- (id)awakeAfterUsingCoder:(id)arg1;
- (id)replacementObjectForCoder:(id)arg1;
- (unsigned long long)hash;
- (BOOL)isEqual:(id)arg1;
- (id)initWithRed:(double)arg1 green:(double)arg2 blue:(double)arg3 alpha:(double)arg4;
- (id)RGBADictionary;
- (id)svgRepresentation;
- (id)NSColorForContext:(id)arg1;

@end

*/