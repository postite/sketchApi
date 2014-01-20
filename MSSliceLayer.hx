extern class MSSliceLayer extends MSLayer{
//Subclass of MSLayer representing a slice in the document. Although it may have a style attribute, this is never used.

//MSSliceLayer has - like MSLayer - a Frame property that is an MSRect which determines its position in the canvas or inside its artboard.

//To export a slice you can use something like the following code:

//var slice = [[[doc currentPage] slices] firstObject];
//[doc saveArtboardOrSlice:slice toFile:"~/desktop/test.png"];
}

