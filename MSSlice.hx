import GKRect.CGRect;
@:publicFields
extern class MSSlice 
{
	
	function rect():CGRect;
	function name():String;
	function includedLayerIDs():SketchArray<String>;
	function layerIsIncluded(id:MSLayer):Bool;
	inline static function sliceWithRect(rect:GKRect.CGRect,scale:Float):Dynamic
	{
		return untyped MSSlice.sliceWithRect_scale(rect,scale);
	}

	inline static function sliceWithName(name:String,rect:GKRect.CGRect):Dynamic
	{
		return untyped MSSlice.sliceWithName_rect(name,rect);
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