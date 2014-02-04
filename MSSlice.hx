@:publicFields
extern class MSSlice
{
	function new(){}

	
	inline static function sliceWithRect(rect:GKRect.CGRect,scale:Float):Dynamic
	{
		return untyped MSSlice.sliceWithRect_scale(rect,scale);
	}
}


/*


@interface MSSlice : NSObject
{
    NSString *_name;
    unsigned long long _options;
    NSSet *_includedLayerIDs;
    NSColor *_backgroundColor;
    double _scale;
    struct CGRect _rect;
}

+ (id)sliceWithRect:(struct CGRect)arg1 scale:(double)arg2;
+ (id)sliceWithName:(id)arg1 rect:(struct CGRect)arg2;
@property(nonatomic) double scale; // @synthesize scale=_scale;
@property(copy, nonatomic) NSColor *backgroundColor; // @synthesize backgroundColor=_backgroundColor;
@property(copy, nonatomic) NSSet *includedLayerIDs; // @synthesize includedLayerIDs=_includedLayerIDs;
@property(nonatomic) unsigned long long options; // @synthesize options=_options;
@property(copy, nonatomic) NSString *name; // @synthesize name=_name;
@property(nonatomic) struct CGRect rect; // @synthesize rect=_rect;
- (void).cxx_destruct;
- (BOOL)layerIsIncluded:(id)arg1;

@end


*/