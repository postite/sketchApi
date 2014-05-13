typedef MSStylePartCollection = SketchArray<Dynamic> //Todo

typedef  MSStyleInnerShadow= Dynamic //Todo 

typedef MSGradient=Dynamic;
@:publicFields
extern class MSStyle{

//Represents all style attributes on a layer. Whatever kind of layer you have, each has an valid style object. Some layers will ignore unsupported attributes though (such as a text layer only supports one border even if style objets has more than one)

 public function borders():SketchArray<MSStyleBorder>;
 public function fills():SketchArray<MSStyleFill>;
 public function shadows():SketchArray<MSStyleShadow>;
 public function innerShadows():MSStylePartCollection;

 
 public function hasTextStyle():Bool;
 function hasEnabledShadow():Bool;
 
//Each returns an MSStylePartCollection that contains an array of each represented object. See MSStyleBorder, MSStyleFill, MSStyleShadow and MSStyleInnerShadow for details.

public function contextSettings():MSGraphicsContextSettings;
//Contais and MSGraphicsContextSettings object that holds the opacity and blending mode of its layer
}

/*
@interface _MSStyle : MSModelObject
{
    MSStyleBlur *_blur;
    MSStyleBorderOptions *_borderOptions;
    MSBorderStyleCollection *_borders;
    MSStyleColorControls *_colorControls;
    MSGraphicsContextSettings *_contextSettings;
    MSFillStyleCollection *_fills;
    MSInnerShadowStyleCollection *_innerShadows;
    long long _miterLimit;
    MSStyleReflection *_reflection;
    MSShadowStyleCollection *_shadows;
}

@property(retain, nonatomic) MSShadowStyleCollection *shadows; // @synthesize shadows=_shadows;
@property(retain, nonatomic) MSStyleReflection *reflection; // @synthesize reflection=_reflection;
@property(nonatomic) long long miterLimit; // @synthesize miterLimit=_miterLimit;
@property(retain, nonatomic) MSInnerShadowStyleCollection *innerShadows; // @synthesize innerShadows=_innerShadows;
@property(retain, nonatomic) MSFillStyleCollection *fills; // @synthesize fills=_fills;
@property(retain, nonatomic) MSGraphicsContextSettings *contextSettings; // @synthesize contextSettings=_contextSettings;
@property(retain, nonatomic) MSStyleColorControls *colorControls; // @synthesize colorControls=_colorControls;
@property(retain, nonatomic) MSBorderStyleCollection *borders; // @synthesize borders=_borders;
@property(retain, nonatomic) MSStyleBorderOptions *borderOptions; // @synthesize borderOptions=_borderOptions;
@property(retain, nonatomic) MSStyleBlur *blur; // @synthesize blur=_blur;
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
- (void)setPrimitiveShadows:(id)arg1;
- (id)primitiveShadows;
- (void)setPrimitiveReflection:(id)arg1;
- (id)primitiveReflection;
- (void)setPrimitiveMiterLimit:(long long)arg1;
- (long long)primitiveMiterLimit;
- (void)setPrimitiveInnerShadows:(id)arg1;
- (id)primitiveInnerShadows;
- (void)setPrimitiveFills:(id)arg1;
- (id)primitiveFills;
- (void)setPrimitiveContextSettings:(id)arg1;
- (id)primitiveContextSettings;
- (void)setPrimitiveColorControls:(id)arg1;
- (id)primitiveColorControls;
- (void)setPrimitiveBorders:(id)arg1;
- (id)primitiveBorders;
- (void)setPrimitiveBorderOptions:(id)arg1;
- (id)primitiveBorderOptions;
- (void)setPrimitiveBlur:(id)arg1;
- (id)primitiveBlur;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end*/

