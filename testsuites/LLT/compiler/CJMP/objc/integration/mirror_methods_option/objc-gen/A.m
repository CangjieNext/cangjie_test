#import "A.h"
#import <stdlib.h>
extern void CJImpl_ObjC_cjworld_A_deleteCJObject(int64_t);
extern int64_t CJImpl_ObjC_cjworld_A_initPu(void*);
extern void CJImpl_ObjC_cjworld_A_runFromCJ();

// Interoplib objc common code
extern bool initCJRuntime(const char*);
@implementation A
- (id)init {
    if (self = [super init]) {
        self.$registryId = CJImpl_ObjC_cjworld_A_initPu((__bridge void*)self);
    }
    return self;
}
+ (void)initialize {
    if (self == [A class]) {
        if (!initCJRuntime("libcjworld.dylib")) {
            exit(1);
        }
    }
}
+ (void)runFromCJ {
     CJImpl_ObjC_cjworld_A_runFromCJ();
}
- (void)deleteCJObject {
     CJImpl_ObjC_cjworld_A_deleteCJObject(self.$registryId);
}
- (void)dealloc {
    [self deleteCJObject];
}
@end
