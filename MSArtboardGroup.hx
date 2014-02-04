extern class MSArtboardGroup extends MSLayerGroup{
//Since Sketch 2.2, an Artboard is just special kind of layer. MSSliceLayer has - like MSLayer - a Frame property that is an MSRect which determines its position in the canvas.

//public function layers():SketchArray<MSLayer>;
//To see which layers are inside the Artboard, use the layers property.

//To export an artboard you can use something like the following code:

//var artboard = [[[doc currentPage] artboard] firstObject];
//[doc saveArtboardOrSlice:artboard toFile:"~/desktop/test.png"];
public function horizontalRulerData():MSRulerData;
public function verticalRulerData():MSRulerData;
//Both return the MSRulerData object used to store rulers for their respective axes. Note that this data is only used on the artboard itself.

//override 
//public function name():String;

}

/*
@interface _MSArtboardGroup : MSLayerGroup
{
    MSBaseGrid *_grid;
    MSRulerData *_horizontalRulerData;
    MSLayerContainer *_sliceContainer;
    MSRulerData *_verticalRulerData;
}

@property(copy, nonatomic) MSRulerData *verticalRulerData; // @synthesize verticalRulerData=_verticalRulerData;
@property(retain, nonatomic) MSLayerContainer *sliceContainer; // @synthesize sliceContainer=_sliceContainer;
@property(copy, nonatomic) MSRulerData *horizontalRulerData; // @synthesize horizontalRulerData=_horizontalRulerData;
@property(copy, nonatomic) MSBaseGrid *grid; // @synthesize grid=_grid;
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
- (void)setPrimitiveVerticalRulerData:(id)arg1;
- (id)primitiveVerticalRulerData;
- (void)setPrimitiveSliceContainer:(id)arg1;
- (id)primitiveSliceContainer;
- (void)setPrimitiveHorizontalRulerData:(id)arg1;
- (id)primitiveHorizontalRulerData;
- (void)setPrimitiveGrid:(id)arg1;
- (id)primitiveGrid;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end
*/