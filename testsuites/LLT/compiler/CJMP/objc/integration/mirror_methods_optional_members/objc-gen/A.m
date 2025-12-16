#import "A.h"
#import "Cangjie.h"
#import <dlfcn.h>
#import <stdlib.h>
static int64_t (*CJImpl_ObjC_cjworld_A_init_Pu)(void*) = NULL;
static int64_t (*CJImpl_ObjC_cjworld_A2_init_Pu)(void*) = NULL;
static void (*CJImpl_ObjC_cjworld_A_deleteCJObject)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_A2_deleteCJObject)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_A_aMirrorSuper)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_A_implALogic)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_A2_a2MirrorSuper)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_A2_a2aMirrorSuper)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_A2_implA2Logic)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_A2_runFromCJ)(int64_t) = NULL;
static void* CJWorldDLHandle = NULL;
static struct RuntimeParam defaultCJRuntimeParams = {0};
@implementation A
- (id)init {
    if (self = [super init]) {
        self.$registryId = CJImpl_ObjC_cjworld_A_init_Pu((__bridge void*)self);
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
        if (LoadCJLibraryWithInit("libcjworld.so") != E_OK) {
            NSLog(@"ERROR: Failed to init cjworld library ");
            exit(1);
        }
        if ((CJWorldDLHandle = dlopen("libcjworld.so", RTLD_LAZY)) == NULL) {
            NSLog(@"ERROR: Failed to open cjworld library ");
            NSLog(@"%s", dlerror());
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A_init_Pu = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A_init_Pu")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A_init_Pu symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A2_init_Pu = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A2_init_Pu")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A2_init_Pu symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A_deleteCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A_deleteCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A_deleteCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A2_deleteCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A2_deleteCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A2_deleteCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A_aMirrorSuper = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A_aMirrorSuper")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A_aMirrorSuper symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A_implALogic = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A_implALogic")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A_implALogic symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A2_a2MirrorSuper = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A2_a2MirrorSuper")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A2_a2MirrorSuper symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A2_a2aMirrorSuper = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A2_a2aMirrorSuper")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A2_a2aMirrorSuper symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A2_implA2Logic = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A2_implA2Logic")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A2_implA2Logic symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_A2_runFromCJ = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_A2_runFromCJ")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_A2_runFromCJ symbol in cjworld");
            exit(1);
        }
    }
}
- (void)aMirrorSuper {
     CJImpl_ObjC_cjworld_A_aMirrorSuper(self.$registryId);
}
- (void)implALogic {
     CJImpl_ObjC_cjworld_A_implALogic(self.$registryId);
}
- (void)deleteCJObject {
     CJImpl_ObjC_cjworld_A_deleteCJObject(self.$registryId);
}
- (void)dealloc {
    [self deleteCJObject];
}
@end
