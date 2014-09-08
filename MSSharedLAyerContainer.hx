

extern class MSSharedLayerContainer{
		
	public function symbolForInstance(id:Dynamic):Dynamic;

	//not documented
	public function objects():SketchArray<MSSharedLayer>;
	
}

extern class MSSharedLayerTextStyleContainer {
public function objects():SketchArray<MSSharedLayerStyle>;
public inline function addSharedStyleWithName(styleName:String,style:MSStyle):MSSharedLayerStyle{
	return untyped this.addSharedStyleWithName_firstInstance(styleName,style);
}
public function removeSharedStyle(style:MSSharedLayerStyle):Void;
public function sharedStyleWithID(id:String):MSSharedLayerStyle;//sharedObjectID
}
extern class  MSSharedLayer{
	//undoc 
	public function instances():SketchArray<String>; // MSLAyer.originalObjectID
	
	public function name():String;
	public function symbol():MSLayerGroup;
	public function defaultName():String; //Symbol
	public function type():Int; //0
	
	
}

extern class MSSharedLayerStyle{

	//undoc
	public function name():String;
	public function defaultName():String;
	public function type():Int;
	public function style():MSStyle;
	public function newInstance():Dynamic;

	
	
}
/*
@interface MSSharedLayer : _MSSharedLayer
{
}

- (id)newInstanceReplacingLayer:(id)arg1;
- (void)prepareToBecomeSharedObjectValue:(struct MSModelObject *)arg1;
- (unsigned long long)type;
- (id)newUnregisteredInstance;
- (id)newInstance;
- (id)symbol;
- (id)defaultName;

@end
*/


/*

@interface MSSharedLayerContainer : _MSSharedLayerContainer
{
}

- (id)layersToIterateOver;
- (void)syncInstance:(id)arg1 withTemplateInstance:(id)arg2 referenceInstance:(id)arg3;
- (BOOL)canMakeSymbolForLayers:(id)arg1;
- (id)firstNonSymbolContainerForGroup:(id)arg1;
- (BOOL)isLayerContainedByAnySymbol:(id)arg1;
- (id)sharedObjectContainingLayer:(id)arg1;
- (void)registerInstance:(id)arg1 withSharedStyle:(id)arg2;
- (unsigned long long)numberOfSymbols;
- (long long)indexOfSymbol:(id)arg1;
- (id)symbolAtIndex:(unsigned long long)arg1;
- (id)symbolWithID:(id)arg1;
- (id)symbolForInstance:(id)arg1;
- (BOOL)isSymbolForInstance:(id)arg1;
- (void)removeSymbol:(id)arg1;
- (id)mergeSymbolWithName:(id)arg1 symbolID:(id)arg2 instance:(id)arg3;
- (id)addSymbolWithName:(id)arg1 firstInstance:(id)arg2;
- (void)enumeratePotentialInstancesInLayer:(id)arg1 block:(CDUnknownBlockType)arg2;
- (Class)sharedObjectClass;

@end

*/

/*

#import "_MSSharedLayerStyle.h"

@class MSStyle;

@interface MSSharedLayerStyle : _MSSharedLayerStyle
{
}

- (unsigned long long)type;
- (id)newInstance;
@property(readonly, nonatomic) MSStyle *style;
- (id)defaultName;
- (void)migratePropertiesFromV23OrEarlierWithCoder:(id)arg1;

@end
*/