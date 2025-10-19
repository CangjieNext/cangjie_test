#import "A.h"
#import "Cangjie.h"
#import <dlfcn.h>
#import <stdlib.h>
static int64_t (*CJImpl_ObjC_cjworld_A_initPu)(void*) = NULL;
static void (*CJImpl_ObjC_cjworld_A_deleteCJObject)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_A_runFromCJ)() = NULL;
static void* CJWorldDLHandle = NULL;
static struct RuntimeParam defaultCJRuntimeParams = {0};
@implementation A
- (id)init {
    if (self = [super init]) {
        self.$registryId = CJImpl_ObjC_cjworld_A_initPu((__bridge void*)self);
    }
    return self;
}
+ (void)initialize {
    if (self == [A class]) {
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
        if ((CJImpl_ObjC_cjworld_A_initPu = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A_initPu")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A_initPu symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A_deleteCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A_deleteCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A_deleteCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A_runFromCJ = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A_runFromCJ")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A_runFromCJ symbol in cjworld");
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
