extern class MSCurvePoint{


public function point():Dynamic;
public function curveFrom():Dynamic;
public function curveTo():Dynamic;




}


/*

@interface _MSCurvePoint : MSModelObject
{
    BOOL _hasCurveFrom;
    BOOL _hasCurveTo;
    double _cornerRadius;
    long long _curveMode;
    struct CGPoint _curveFrom;
    struct CGPoint _curveTo;
    struct CGPoint _point;
}

@property(nonatomic) struct CGPoint point; // @synthesize point=_point;
@property(nonatomic) BOOL hasCurveTo; // @synthesize hasCurveTo=_hasCurveTo;
@property(nonatomic) BOOL hasCurveFrom; // @synthesize hasCurveFrom=_hasCurveFrom;
@property(nonatomic) struct CGPoint curveTo; // @synthesize curveTo=_curveTo;
@property(nonatomic) long long curveMode; // @synthesize curveMode=_curveMode;
@property(nonatomic) struct CGPoint curveFrom; // @synthesize curveFrom=_curveFrom;
@property(nonatomic) double cornerRadius; // @synthesize cornerRadius=_cornerRadius;
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
- (void)setPrimitivePoint:(struct CGPoint)arg1;
- (struct CGPoint)primitivePoint;
- (void)setPrimitiveHasCurveTo:(BOOL)arg1;
- (BOOL)primitiveHasCurveTo;
- (void)setPrimitiveHasCurveFrom:(BOOL)arg1;
- (BOOL)primitiveHasCurveFrom;
- (void)setPrimitiveCurveTo:(struct CGPoint)arg1;
- (struct CGPoint)primitiveCurveTo;
- (void)setPrimitiveCurveMode:(long long)arg1;
- (long long)primitiveCurveMode;
- (void)setPrimitiveCurveFrom:(struct CGPoint)arg1;
- (struct CGPoint)primitiveCurveFrom;
- (void)setPrimitiveCornerRadius:(double)arg1;
- (double)primitiveCornerRadius;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end

*/