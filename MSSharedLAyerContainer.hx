

extern class MSSharedLayerContainer{

	//not documented
	public function objects():SketchArray<MSSharedLayerStyle>;
	
}



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