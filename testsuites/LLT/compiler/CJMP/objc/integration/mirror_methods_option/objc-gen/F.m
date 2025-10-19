#import "F.h"
#import "Cangjie.h"
#import <dlfcn.h>
#import <stdlib.h>
static int64_t (*CJImpl_ObjC_cjworld_F_initPu)(void*) = NULL;
static void (*CJImpl_ObjC_cjworld_F_deleteCJObject)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_F_pingF)(int64_t) = NULL;
static void* CJWorldDLHandle = NULL;
static struct RuntimeParam defaultCJRuntimeParams = {0};
@implementation F
- (id)init {
    if (self = [super init]) {
        self.$registryId = CJImpl_ObjC_cjworld_F_initPu((__bridge void*)self);
    }
    return self;
}
+ (void)initialize {
    if (self == [F class]) {
        defaultCJRuntimeParams.logParam.logLevel = RTLOG_ERROR;
        if (InitCJRuntime(&defaultCJRuntimeParams) != E_OK) {
            NSLog(@"ERROR: Failed to initialize Cangjie runtime");
            exit(1);
        }
        if (LoadCJLibraryWithInit("libcjworld.dylib") != E_OK) {
            NSLog(@"ERROR: Failed to init cjworld library ");
            exit(1);
        }
        if ((CJWorldDLHandle = dlopen("libcjworld.dylib", RTLD_LAZY)) == NULL) {
            NSLog(@"ERROR: Failed to open cjworld library ");
            NSLog(@"%s", dlerror());
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_F_initPu = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_F_initPu")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_F_initPu symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_F_deleteCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_F_deleteCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_F_deleteCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_F_pingF = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_F_pingF")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_F_pingF symbol in cjworld");
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
