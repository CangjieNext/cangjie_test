#import <Foundation/Foundation.h>
#import <stddef.h>
@interface BaseClass : NSObject
- (id)initWithRegistryId:(int64_t)registryId;
-(id)init:(int64_t)val;
+ (void)initialize;
@property (readwrite) int64_t $registryId;
@property (readwrite) bool $initedFromObjC;
- (id)reinitWithRegistryId:(int64_t)registryId;
- (oneway void)release;
-(int64_t)compute;
- (void)dealloc;
@end
