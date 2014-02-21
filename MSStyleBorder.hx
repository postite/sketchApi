extern class MSStyleBorder extends MSStyleBasicFill{

	public function position():Int;
	public function thickness():Int;

	public function copyPropertiesToObjectCopy(arg:Dynamic):Void;
	

}



/*
@interface _MSStyleBorder : MSStyleBasicFill
{
    long long _position;
    double _thickness;
}

@property(nonatomic) double thickness; // @synthesize thickness=_thickness;
@property(nonatomic) long long position; // @synthesize position=_position;
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
- (void)setPrimitiveThickness:(double)arg1;
- (double)primitiveThickness;
- (void)setPrimitivePosition:(long long)arg1;
- (long long)primitivePosition;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end
*/