import MSStyle.MSGradient;
extern class MSStyleBasicFill{

	public function name():String;
	public function color():MSColor;
	public function setColor(col:MSColor):Void;
	public function gradient():MSGradient;
	public function filltype():Int;
	
	
		
	
	//..etc

}

/*
@interface _MSStyleBasicFill : MSStylePart
{
    MSColor *_color;
    MSGraphicsContextSettings *_contextSettings;
    unsigned long long _fillType;
    MSGradient *_gradient;
    NSString *_name;
}

@property(copy, nonatomic) NSString *name; // @synthesize name=_name;
@property(retain, nonatomic) MSGradient *gradient; // @synthesize gradient=_gradient;
@property(nonatomic) unsigned long long fillType; // @synthesize fillType=_fillType;
@property(retain, nonatomic) MSGraphicsContextSettings *contextSettings; // @synthesize contextSettings=_contextSettings;
@property(copy, nonatomic) MSColor *color; // @synthesize color=_color;
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
- (void)setPrimitiveName:(id)arg1;
- (id)primitiveName;
- (void)setPrimitiveGradient:(id)arg1;
- (id)primitiveGradient;
- (void)setPrimitiveFillType:(unsigned long long)arg1;
- (unsigned long long)primitiveFillType;
- (void)setPrimitiveContextSettings:(id)arg1;
- (id)primitiveContextSettings;
- (void)setPrimitiveColor:(id)arg1;
- (id)primitiveColor;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end
*/