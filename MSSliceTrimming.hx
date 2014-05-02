typedef SLICE=MSSlice

@:publicFields
extern class  MSSliceTrimming{

static function simpleSafeRectForSlice(s:SLICE):GKRect.CGRect;
static function safeRectForSlice(s:SLICE):GKRect.CGRect;
inline static function basicSliceFromLayer(s:MSLayer,page:MSPage):MSSlice{
	return untyped MSSliceTrimming.basicSliceFromLayer_page(s,page);
}

inline static function trimmedRectForSlice(s:MSSlice,onPage:MSPage):GKRect.CGRect{
	return untyped MSSliceTrimming.trimmedRectForSlice_onPage(s,onPage);
}


//trim layer to fit border and shadows // MAGIC
//!it actually resize layer
//don't know what fitLayer type is ( not Bool not Int )
inline static function trimSlice(s:MSLayer,?toFitLayers:Dynamic=null):GKRect.CGRect{
	return untyped MSSliceTrimming.trimSlice_toFitLayers(s,toFitLayers);
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