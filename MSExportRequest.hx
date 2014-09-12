@:publicFields
@:native("MSExportRequest")
extern class MSExportRequest{

    function page():MSPage;
    function setPage(p:MSPage):Void;
    function setScale(n:Float):Void;
    function scale():Float;
    function setFormat(s:String):Void;
    function format():String;
    function rect():GKRect;

    static inline function requestWithRect(struct:GKRect.CGRect):Dynamic{
        return untyped MSExportRequest.requestWithRect(struct);
    }
}


/*
sketch Next

#import "NSObject.h"

@class MSColor, MSPage, NSSet, NSString;

@interface MSExportRequest : NSObject
{
    BOOL _shouldTrim;
    BOOL _saveForWeb;
    BOOL _progressive;
    BOOL _compact;
    BOOL _includeArtboardBackground;
    NSString *_name;
    unsigned long long _options;
    NSSet *_includedLayerIDs;
    MSColor *_backgroundColor;
    double _scale;
    MSPage *_page;
    NSString *_format;
    double _compression;
    id _rootLayerID;
    struct CGRect _rect;
}

+ (id)requestWithRect:(struct CGRect)arg1 scale:(double)arg2;
+ (id)requestWithName:(id)arg1 rect:(struct CGRect)arg2;
@property(copy, nonatomic) id rootLayerID; // @synthesize rootLayerID=_rootLayerID;
@property(nonatomic) BOOL includeArtboardBackground; // @synthesize includeArtboardBackground=_includeArtboardBackground;
@property(nonatomic) BOOL compact; // @synthesize compact=_compact;
@property(nonatomic) BOOL progressive; // @synthesize progressive=_progressive;
@property(nonatomic) double compression; // @synthesize compression=_compression;
@property(nonatomic) BOOL saveForWeb; // @synthesize saveForWeb=_saveForWeb;
@property(copy, nonatomic) NSString *format; // @synthesize format=_format;
@property(retain, nonatomic) MSPage *page; // @synthesize page=_page;
@property(nonatomic) BOOL shouldTrim; // @synthesize shouldTrim=_shouldTrim;
@property(nonatomic) double scale; // @synthesize scale=_scale;
@property(copy, nonatomic) MSColor *backgroundColor; // @synthesize backgroundColor=_backgroundColor;
@property(copy, nonatomic) NSSet *includedLayerIDs; // @synthesize includedLayerIDs=_includedLayerIDs;
@property(nonatomic) unsigned long long options; // @synthesize options=_options;
@property(copy, nonatomic) NSString *name; // @synthesize name=_name;
@property(nonatomic) struct CGRect rect; // @synthesize rect=_rect;
- (void).cxx_destruct;
- (BOOL)layerIsIncluded:(id)arg1;
- (id)init;

@end

*/