#import <Foundation/Foundation.h>
#import <stddef.h>
__attribute__((objc_subclassing_restricted))
@interface AliasTestClass : NSObject
- (id)init;
- (id)initWithRegistryId:(int64_t)registryId;
+ (void)initialize;
@property (readwrite) int64_t $registryId;
- (int64_t)testIntAlias:(int64_t)val;
- (BOOL)testBoolAlias:(BOOL)flag;
- (int64_t)testMixedAlias:(int64_t)val :(BOOL)flag;
- (void)deleteCJObject;
- (void)dealloc;
@end
