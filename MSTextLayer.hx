
//@see http://www.gnustep.org/resources/OpenStepSpec/ApplicationKit/Classes/NSText.html
extern class MSTextLayer extends MSLayer{

//Represents text. Subclass of MSLayer Only the most basic of properties have yet been exposed.

public function fontSize():Int;
public function fontPostscriptName():String;
//public function textColor():MSColor;
public function textAlignment():Dynamic;
public function characterSpacing():Int;
public function lineSpacing():Int;

//undocumented
//public function textColor():Color;

public function stringValue():String;

//untested
public function setFont(f:String):Void;
public function setFontPostscriptName(f:String):Void;

}

/*
@interface _MSTextLayer : MSStyledLayer
{
    BOOL _automaticallyDrawOnUnderlyingPath;
    NSTextStorage *_storage;
    long long _textBehaviour;
}

@property(nonatomic) long long textBehaviour; // @synthesize textBehaviour=_textBehaviour;
@property(retain, nonatomic) NSTextStorage *storage; // @synthesize storage=_storage;
@property(nonatomic) BOOL automaticallyDrawOnUnderlyingPath; // @synthesize automaticallyDrawOnUnderlyingPath=_automaticallyDrawOnUnderlyingPath;
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
- (void)setPrimitiveTextBehaviour:(long long)arg1;
- (long long)primitiveTextBehaviour;
- (void)setPrimitiveStorage:(id)arg1;
- (id)primitiveStorage;
- (void)setPrimitiveAutomaticallyDrawOnUnderlyingPath:(BOOL)arg1;
- (BOOL)primitiveAutomaticallyDrawOnUnderlyingPath;
- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end
*/