typedef SLICE=Dynamic

@:publicFields
extern class  MSSliceTrimming{

static function simpleSafeRectForSlice(s:SLICE):GKRect.CGRect;
static function safeRectForSlice(s:SLICE):GKRect.CGRect;
inline static function basicSliceFromLayer(s:SLICE,page:MSPage):GKRect.CGRect{
	return untyped MSSliceTrimming.basicSliceFromLayer_page(s,page);
}

inline static function trimmedRectForSlice(s:SLICE,onPage:MSPage):GKRect.CGRect{
	return untyped MSSliceTrimming.trimmedRectForSlice_onPage(s,onPage);
}
inline static function trimSlice(s:SLICE,toFitLayers):GKRect.CGRect{
	return MSSliceTrimming.trimSlice_toFitLayers(s,toFitLayers);
}

}


/*
SKETCH3


#import "NSObject.h"

@interface MSSliceTrimming : NSObject
{
}

+ (struct CGRect)simpleSafeRectForSlice:(id)arg1;
+ (struct CGRect)safeRectForSlice:(id)arg1;
+ (id)basicSliceFromLayer:(id)arg1 page:(id)arg2;
+ (struct CGRect)_trimmedRectForSlice:(id)arg1 onPage:(id)arg2;
+ (struct CGRect)trimmedRectForSlice:(id)arg1 onPage:(id)arg2;
+ (void)trimSlice:(id)arg1 toFitLayers:(id)arg2;

@end


*/