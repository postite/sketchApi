extern class MSSliceLayer extends MSLayer{
//Subclass of MSLayer representing a slice in the document. Although it may have a style attribute, this is never used.

//MSSliceLayer has - like MSLayer - a Frame property that is an MSRect which determines its position in the canvas or inside its artboard.

//To export a slice you can use something like the following code:

//var slice = [[[doc currentPage] slices] firstObject];
//[doc saveArtboardOrSlice:slice toFile:"~/desktop/test.png"];




	///undocumented

//function .cxx_destruct;//(void)
function copyPropertiesToObjectCopy(v:Dynamic /*(id)arg1*/):Void;//(void)
function setUndoManagerOnChildren(v:Dynamic /*(id)arg1*/):Void;//(void)
function setAsParentOnChildren():Void;//(void)
function decodePropertiesCompatibleWithCoder(v:Dynamic /*(id)arg1*/):Void;//(void)
function decodePropertiesManuallyWithCoder(v:Dynamic /*(id)arg1*/):Void;//(void)
function decodePropertiesWithCoder(v:Dynamic /*(id)arg1*/):Void;//(void)
function encodePropertiesCompatibleWithCoder(v:Dynamic /*(id)arg1*/):Void;//(void)
function encodePropertiesManuallyWithCoder(v:Dynamic /*(id)arg1*/):Void;//(void)
function encodePropertiesWithCoder(v:Dynamic /*(id)arg1*/):Void;//(void)
function fillInEmptyObjects():Void;//(void)
function hasDefaultValues():Bool;//(BOOL)
function initEmptyObject():Void;//(void)
function setPrimitiveShouldTrim(b:Bool):Void;//(void)
function primitiveShouldTrim():Void;//(BOOL)
function setPrimitiveOptions(v:Int /*(unsigned long long)arg1*/):Void;//(void)
function primitiveOptions():Int;//unsigned long
function setPrimitiveIncludedLayerIds(v:Dynamic):Void;//(id)arg1;//(void)
function primitiveIncludedLayerIds():Dynamic;//(id)
function setPrimitiveIncludeRetinaVersion(b:Bool):Void;//(BOOL)arg1;//(void)
function primitiveIncludeRetinaVersion():Bool;//(BOOL)
function setPrimitiveCurrentResolution(v:Float):Void;//(long long)arg1;//(void)
function primitiveCurrentResolution():Float;//long long
function setPrimitiveBackgroundColor(v:Dynamic):Void;//(id)arg1;//(void)
function primitiveBackgroundColor():Dynamic;//(id)
//function enumerateProperties():(CDUnknownBlockType)arg1;//(void)

}


/*

@interface _MSSliceLayer : MSLayer
{
    BOOL _includeRetinaVersion;
    BOOL _shouldTrim;
    NSColor *_backgroundColor;
    long long _currentResolution;
    MSArray *_includedLayerIds;
    unsigned long long _options;
}

@property(nonatomic) BOOL shouldTrim; // @synthesize shouldTrim=_shouldTrim;
@property(nonatomic) unsigned long long options; // @synthesize options=_options;
@property(retain, nonatomic) MSArray *includedLayerIds; // @synthesize includedLayerIds=_includedLayerIds;
@property(nonatomic) BOOL includeRetinaVersion; // @synthesize includeRetinaVersion=_includeRetinaVersion;
@property(nonatomic) long long currentResolution; // @synthesize currentResolution=_currentResolution;
@property(copy, nonatomic) NSColor *backgroundColor; // @synthesize backgroundColor=_backgroundColor;
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
- (void)setPrimitiveShouldTrim:(BOOL)arg1;
- (BOOL)primitiveShouldTrim;
- (void)setPrimitiveOptions:(unsigned long long)arg1;
- (unsigned long long)primitiveOptions;
- (void)setPrimitiveIncludedLayerIds:(id)arg1;
- (id)primitiveIncludedLayerIds;
- (void)setPrimitiveIncludeRetinaVersion:(BOOL)arg1;
- (BOOL)primitiveIncludeRetinaVersion;
- (void)setPrimitiveCurrentResolution:(long long)arg1;
- (long long)primitiveCurrentResolution;
- (void)setPrimitiveBackgroundColor:(id)arg1;
- (id)primitiveBackgroundColor;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end

*/
