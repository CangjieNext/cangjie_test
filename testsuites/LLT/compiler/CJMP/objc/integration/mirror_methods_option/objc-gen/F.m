#import "F.h"
#import <stdlib.h>
extern void CJImpl_ObjC_cjworld_F_deleteCJObject(int64_t);
extern int64_t CJImpl_ObjC_cjworld_F_initPu(void*);
extern void CJImpl_ObjC_cjworld_F_pingF(int64_t);

// Interoplib objc common code
extern bool initCJRuntime(const char*);
@implementation F
- (id)init {
    if (self = [super init]) {
        self.$registryId = CJImpl_ObjC_cjworld_F_initPu((__bridge void*)self);
    }
    return self;
}
+ (void)initialize {
    if (self == [F class]) {
        if (!initCJRuntime("libcjworld.dylib")) {
           exit(1);
        }
    }
}
- (void)pingF {
     CJImpl_ObjC_cjworld_F_pingF(self.$registryId);
}
- (void)deleteCJObject {
     CJImpl_ObjC_cjworld_F_deleteCJObject(self.$registryId);
}
- (void)dealloc {
    [self deleteCJObject];
}
@end
