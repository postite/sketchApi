typedef MSStylePartCollection = SketchArray<Dynamic> //Todo
typedef MSGraphicsContextSettings =Dynamic //TOdo


typedef MSStyleBorder= Dynamic //Todo

typedef  MSStyleShadow= Dynamic //Todo 
typedef  MSStyleInnerShadow= Dynamic //Todo 
typedef NSImage= Dynamic;
typedef MSGradient=Dynamic;

extern class MSStyle{

//Represents all style attributes on a layer. Whatever kind of layer you have, each has an valid style object. Some layers will ignore unsupported attributes though (such as a text layer only supports one border even if style objets has more than one)

 public function borders():MSStylePartCollection;
 public function fills():MSStylePartCollection;
 public function shadows():MSStylePartCollection;
 public function innerShadows():MSStylePartCollection;
//Each returns an MSStylePartCollection that contains an array of each represented object. See MSStyleBorder, MSStyleFill, MSStyleShadow and MSStyleInnerShadow for details.

public function contextSettings():MSGraphicsContextSettings;
//Contais and MSGraphicsContextSettings object that holds the opacity and blending mode of its layer
}

