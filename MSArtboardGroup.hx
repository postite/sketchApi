extern class MSArtboardGroup{
extern class MSArtboardGroup extends MSLayerGroup{
//Since Sketch 2.2, an Artboard is just special kind of layer. MSSliceLayer has - like MSLayer - a Frame property that is an MSRect which determines its position in the canvas.

public function layers():SketchArray<MSLayer>;
//To see which layers are inside the Artboard, use the layers property.

//To export an artboard you can use something like the following code:

//var artboard = [[[doc currentPage] artboard] firstObject];
//[doc saveArtboardOrSlice:artboard toFile:"~/desktop/test.png"];
public function horizontalRulerData():MSRulerData;
public function verticalRulerData():MSRulerData;
//Both return the MSRulerData object used to store rulers for their respective axes. Note that this data is only used on the artboard itself.

//undoc
public function name():String;

}