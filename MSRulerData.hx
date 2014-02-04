extern class MSRulerData{


//Stores the guides used on its ruler. MSPage and MSArtboardGroup both return their ruler data using -horizontalRulerData and -verticalRulerData

public function addGuideWithValue(v:Int):Dynamic;
//Supply an integer value (measured from the origin of the ruler). Adds a new guide at the given value

public function numberOfGuides():Int;
//Returns the number of guides on this ruler

public function guideAtIndex(index:Int):Int;
//Returns the integer value of the given guide. The argument is a zero-based index value.

public function removeGuideAtIndex(index:Int):Void;
//Remove the guide at the given index.
}

/*

@interface _MSRulerData : MSModelObject
{
    long long _base;
    MSArray *_guides;
}

@property(copy, nonatomic) MSArray *guides; // @synthesize guides=_guides;
@property(nonatomic) long long base; // @synthesize base=_base;
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
- (void)setPrimitiveGuides:(id)arg1;
- (id)primitiveGuides;
- (void)setPrimitiveBase:(long long)arg1;
- (long long)primitiveBase;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end

*/