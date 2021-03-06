extern class MSExportOptions
{
	public function sizes():SketchArray<MSExportSize>;
	public function shouldTrim():Bool; //if trim checked
	public function includedLayerIds():SketchArray<MSLayer>;
	public function layerOptions():Int; //if 2== Export GroupContentOnly
	
}
@:publicFields
extern class MSExportSize{

	//static defaultNameForScale:(double)arg1;
	function defaultName():String;
	function remove():Void;
	function parentLayer():Dynamic;
	//function initWithScale:(double)arg1 name:(id)arg2 format:(id)arg3;
	function isVectorExport():Bool;


	//from interface _MSExportSize
	function scale():Float;

	function name():String;
	function format():Dynamic;
	function visibleScaleType():Dynamic;
}





// #import "_MSExportSize.h"

// @interface MSExportSize : _MSExportSize
// {
// }

// + (id)defaultNameForScale:(double)arg1;
// + (id)migrateExportSizesWithName:(id)arg1 currentResolution:(long long)arg2 includeRetinaVersion:(BOOL)arg3;
// + (id)validFormats;
// + (id)sizeWithScale:(double)arg1 name:(id)arg2 format:(id)arg3;
// - (id)defaultName;
// - (void)remove;
// - (id)parentLayer;
// - (id)initWithScale:(double)arg1 name:(id)arg2 format:(id)arg3;
// - (BOOL)isVectorExport;

// @end


///Sketch3 
/*
//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "_MSExportOptions.h"

@interface MSExportOptions : _MSExportOptions
{
}

- (id)addExportSize;

@end

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import "MSModelObject.h"

@class MSArray;

@interface _MSExportOptions : MSModelObject
{
    BOOL _shouldTrim;
    MSArray *_includedLayerIds;
    unsigned long long _layerOptions;
    MSArray *_sizes;
}

@property(retain, nonatomic) MSArray *sizes; // @synthesize sizes=_sizes;
@property(nonatomic) BOOL shouldTrim; // @synthesize shouldTrim=_shouldTrim;
@property(nonatomic) unsigned long long layerOptions; // @synthesize layerOptions=_layerOptions;
@property(retain, nonatomic) MSArray *includedLayerIds; // @synthesize includedLayerIds=_includedLayerIds;
- (void).cxx_destruct;
- (BOOL)isEqualForSync:(id)arg1;
- (void)syncPropertiesMatchingReference:(id)arg1 withObject:(id)arg2;
- (void)copyPropertiesToObjectCopy:(id)arg1;
- (void)setAsParentOnChildren;
- (void)decodePropertiesWithCoder:(id)arg1;
- (void)encodePropertiesWithCoder:(id)arg1;
- (void)fillInEmptyObjects;
- (BOOL)hasDefaultValues;
- (void)initEmptyObject;
- (void)setPrimitiveSizes:(id)arg1;
- (id)primitiveSizes;
- (void)setPrimitiveShouldTrim:(BOOL)arg1;
- (BOOL)primitiveShouldTrim;
- (void)setPrimitiveLayerOptions:(unsigned long long)arg1;
- (unsigned long long)primitiveLayerOptions;
- (void)setPrimitiveIncludedLayerIds:(id)arg1;
- (id)primitiveIncludedLayerIds;
- (void)enumerateChildProperties:(CDUnknownBlockType)arg1;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end

*/