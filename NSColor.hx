
//move to ns
//@see  http://www.gnustep.org/resources/OpenStepSpec/ApplicationKit/Classes/NSColor.html 
extern class NSColor{

	
	public function red():Float;
	public function green():Float;
	public function blue():Float;

	public function set():Void; //// ??????
	
}

/*

@interface _MSColor : MSModelObject
{
    double _alpha;
    double _blue;
    double _green;
    double _red;
}

@property(nonatomic) double red; // @synthesize red=_red;
@property(nonatomic) double green; // @synthesize green=_green;
@property(nonatomic) double blue; // @synthesize blue=_blue;
@property(nonatomic) double alpha; // @synthesize alpha=_alpha;
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
- (void)setPrimitiveRed:(double)arg1;
- (double)primitiveRed;
- (void)setPrimitiveGreen:(double)arg1;
- (double)primitiveGreen;
- (void)setPrimitiveBlue:(double)arg1;
- (double)primitiveBlue;
- (void)setPrimitiveAlpha:(double)arg1;
- (double)primitiveAlpha;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end

*/