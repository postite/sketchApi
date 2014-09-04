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
 public function textStyle():MSTextStyle;
 public function sharedObjectID():String;

 
 function hasEnabledShadow():Bool;
 
//Each returns an MSStylePartCollection that contains an array of each represented object. See MSStyleBorder, MSStyleFill, MSStyleShadow and MSStyleInnerShadow for details.

public function contextSettings():MSGraphicsContextSettings;
//Contais and MSGraphicsContextSettings object that holds the opacity and blending mode of its layer


}

/*
#import "_MSStyle.h"

#import "MSSharedObjectInstance.h"
#import "MSStylePartDelegate.h"
#import "NSCoding.h"
#import "NSCopying.h"

@class MSStyleBorder, MSStyleFill, MSStyleShadow, NSString;

@interface MSStyle : _MSStyle <NSCoding, MSStylePartDelegate, MSSharedObjectInstance, NSCopying>
{
    id <MSStyleDelegate> _delegate;
}

+ (id)layerStyles;
@property(nonatomic) __weak id <MSStyleDelegate> delegate; // @synthesize delegate=_delegate;
- (void).cxx_destruct;
- (double)thickestOuterStroke;
- (double)thickestInnerStroke;
- (BOOL)hasTextStyle;
- (unsigned long long)type;
- (id)parentStyle;
- (id)parentLayer;
- (BOOL)hasActiveBackgroundBlur;
- (BOOL)supportsAdvancedBorderSettings;
- (void)multiplyBy:(double)arg1;
- (void)prepareObjectCopy:(id)arg1;
- (id)outlineStrokePath:(id)arg1;
- (id)renderBitmapEffects:(id)arg1;
- (BOOL)hasBitmapStylesEnabled;
- (void)handleLightweightObjectChangeForKey:(id)arg1 sender:(id)arg2;
- (void)setTextStyle:(id)arg1;
- (void)layerStyleDidChange;
- (void)setNilValueForKey:(id)arg1;
- (BOOL)hasBlending;
- (id)firstEnabledInnerShadow;
- (id)firstEnabledShadow;
- (id)enabledStyleParts:(id)arg1;
- (id)enabledInnerShadows;
- (id)enabledShadows;
- (id)enabledBorders;
- (id)enabledFills;
- (BOOL)hasEnabledBorder;
- (BOOL)hasEnabledFill;
- (BOOL)hasEnabledShadow;
@property(readonly, nonatomic) MSStyleShadow *innerShadow; // @dynamic innerShadow;
@property(readonly, nonatomic) MSStyleShadow *shadow; // @dynamic shadow;
@property(retain, nonatomic) MSStyleFill *fill;
@property(retain, nonatomic) MSStyleBorder *border;
- (void)readInnerShadowsFromCoder:(id)arg1;
- (void)initFromPreAKWithCoder:(id)arg1;
- (void)initLegacyWithCoder:(id)arg1;
- (unsigned long long)maxLevels;
- (void)addSVGFilterAttributes:(id)arg1 exporter:(id)arg2;
- (id)filtersForBlur:(id)arg1 exporter:(id)arg2;
- (id)filtersForShadow:(id)arg1 exporter:(id)arg2 isInner:(BOOL)arg3 index:(unsigned long long)arg4;
- (void)addSVGAttributes:(id)arg1 forExporter:(id)arg2 level:(unsigned long long)arg3 defaultNone:(BOOL)arg4;
- (id)itemFromCollection:(id)arg1 atLevel:(unsigned long long)arg2;

// Remaining properties
@property(retain, nonatomic) NSString *sharedObjectID;

@end


@end*/

