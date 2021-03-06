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
static inline function slicesFromExportableLayer(l:MSLayer,inRect:GKRect.CGRect):SketchArray<MSExportRequest>{
	return untyped MSSliceMaker.slicesFromExportableLayer_inRect(l,inRect);
}

//sketchNExt
// + (id)slicesFromExportableLayer:(id)arg1 sizes:(id)arg2 inRect:(struct CGRect)arg3;
// + (id)slicesFromExportableLayer:(id)arg1 inRect:(struct CGRect)arg2;
// + (id)slicesFromExportableLayer:(id)arg1 sizes:(id)arg2;
// + (id)slicesFromExportableLayer:(id)arg1;



}



/*
SketchNext


//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "NSObject.h"

@interface MSSliceMaker : NSObject
{
}

+ (void)configureSliceOptions:(id)arg1 forLayer:(id)arg2;
+ (id)sliceFromExportSize:(id)arg1 layer:(id)arg2 inRect:(struct CGRect)arg3;
+ (id)slicesFromExportableLayer:(id)arg1 sizes:(id)arg2 inRect:(struct CGRect)arg3;
+ (id)slicesFromExportableLayer:(id)arg1 inRect:(struct CGRect)arg2;
+ (id)slicesFromExportableLayer:(id)arg1 sizes:(id)arg2;
+ (id)slicesFromExportableLayer:(id)arg1;

@end


*/