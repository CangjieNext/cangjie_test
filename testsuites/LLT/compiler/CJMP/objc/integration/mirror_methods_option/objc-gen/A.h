#import <Foundation/Foundation.h>
#import <stddef.h>
#import "M.h"
@interface A : M
- (id)init;
+ (void)initialize;
@property (readwrite) int64_t $registryId;
+ (void)runFromCJ;
- (void)deleteCJObject;
- (void)dealloc;
@end
