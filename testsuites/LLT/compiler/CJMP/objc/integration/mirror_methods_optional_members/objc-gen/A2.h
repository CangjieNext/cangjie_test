#import <Foundation/Foundation.h>
#import <stddef.h>
#import "A.h"
@interface A2 : A
- (id)init;
+ (void)initialize;
@property (readwrite) int64_t $registryId;
- (void)a2MirrorSuper;
- (void)a2aMirrorSuper;
- (void)implA2Logic;
- (void)runFromCJ;
- (void)deleteCJObject;
- (void)dealloc;
@end
