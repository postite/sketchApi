@:publicFields
extern class MSSliceMaker{
static function bitmapImageRepForLayers(id:MSLayer,inRect:Dynamic):Dynamic{
	return untyped MSSLiceMaker.bitmapRectForLayers_inRect(id,inRect);
}
static function shouldTrimBitmapForPasteboardLayers(id:Dynamic):Bool;

//todo overload
// static function bitmapRectForLayers(id:Dynamic):Dynamic;
// static function bitmapImageRepForLayers(id:Dynamic,trimmedRect:Dynamic):Dynamic{
// 	return untyped MSSLiceMaker.bitmapImageRepForLayers_trimmedRect(id,trimmedRect);
// }

//TODO overload it 
//static function slicesFromExportableLayer:(id)arg1 sizes:(id)arg2;
static function slicesFromExportableLayer(id:MSLayer):MSSlice;
}



/*
Sketch3


#import "MSModelSliceMaker.h"

@interface MSSliceMaker : MSModelSliceMaker
{
}

+ (id)bitmapImageRepForLayers:(id)arg1 inRect:(id)arg2;
+ (BOOL)shouldTrimBitmapForPasteboardLayers:(id)arg1;
+ (id)bitmapRectForLayers:(id)arg1;
+ (id)bitmapImageRepForLayers:(id)arg1 trimmedRect:(id *)arg2;
+ (id)slicesFromExportableLayer:(id)arg1 sizes:(id)arg2;
+ (id)slicesFromExportableLayer:(id)arg1;

@end

*/