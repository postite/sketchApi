extern class MSSharedLayerStyle{

	//undoc
	public function name():String;
	public function defaultName():String;
	public function type():Int;
	public function style():MSStyle;
	public function newInstance():Dynamic;

	
	
}


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