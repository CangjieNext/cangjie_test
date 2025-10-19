#import <Foundation/Foundation.h>
#import <stddef.h>
#import "K.h"
@interface F : K
- (id)init;
+ (void)initialize;
@property (readwrite) int64_t $registryId;
- (void)pingF;
- (void)deleteCJObject;
- (void)dealloc;
@end
