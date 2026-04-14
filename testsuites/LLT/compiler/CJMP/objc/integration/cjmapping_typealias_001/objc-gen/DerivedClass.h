#import <Foundation/Foundation.h>
#import <stddef.h>
#import "BaseClass.h"
@class AliasTestClass;
__attribute__((objc_subclassing_restricted))
@interface DerivedClass : BaseClass
- (id)init:(int64_t)val;
- (id)initWithRegistryId:(int64_t)registryId;
+ (void)initialize;
@property (readwrite) int64_t $registryId;
- (int64_t)compute;
- (AliasTestClass*)getMyAliasTestClass:(AliasTestClass*)c;
- (void)deleteCJObject;
- (void)dealloc;
@end
