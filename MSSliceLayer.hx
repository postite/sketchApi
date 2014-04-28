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

//sketch3 tested
 function exportOptions():MSExportOptions;
/// sketch 3 untested
function hasBackgroundColor():Bool;
function backgroundColor():MSColor;
}


/*
/

*/
