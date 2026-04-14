#import "AliasTestClass.h"
#import "Cangjie.h"
#import <dlfcn.h>
#import <stdlib.h>

typedef struct objc_method* Method;
extern IMP method_getImplementation(Method);
extern Method class_getInstanceMethod(Class, SEL);
extern id objc_getClass(const char *);
static int64_t (*CJImpl_ObjC_cjworld_BaseClass_fwd_init___Puml)(void*,uint64_t,int64_t) = NULL;
static int64_t (*CJImpl_ObjC_cjworld_BaseClass_fwd_compute)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_BaseClass_fwd_deleteCJObject)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_BaseClass_fwd_lockCJObject)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_BaseClass_fwd_unlockCJObject)(int64_t) = NULL;
static int64_t (*CJImpl_ObjC_cjworld_AliasTestClass_init)() = NULL;
static int64_t (*CJImpl_ObjC_cjworld_DerivedClass_init_l)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_AliasTestClass_deleteCJObject)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_BaseClass_deleteCJObject)(int64_t) = NULL;
static void (*CJImpl_ObjC_cjworld_DerivedClass_deleteCJObject)(int64_t) = NULL;
static int64_t (*CJImpl_ObjC_cjworld_AliasTestClass_testIntAlias_l)(int64_t,int64_t) = NULL;
static BOOL (*CJImpl_ObjC_cjworld_AliasTestClass_testBoolAlias_b)(int64_t,BOOL) = NULL;
static int64_t (*CJImpl_ObjC_cjworld_AliasTestClass_testMixedAlias__lb)(int64_t,int64_t,BOOL) = NULL;
static int64_t (*CJImpl_ObjC_cjworld_BaseClass_compute)(int64_t) = NULL;
static int64_t (*CJImpl_ObjC_cjworld_DerivedClass_compute)(int64_t) = NULL;
static int64_t (*CJImpl_ObjC_cjworld_DerivedClass_getMyAliasTestClass_CN7cjworld14AliasTestClassE)(int64_t,int64_t) = NULL;
static void* CJWorldDLHandle = NULL;
static struct RuntimeParam defaultCJRuntimeParams = {0};
@implementation AliasTestClass
- (id)init {
    if (self = [super init]) {
        self.$registryId = CJImpl_ObjC_cjworld_AliasTestClass_init();
    }
    return self;
}
- (id)initWithRegistryId:(int64_t)registryId {
    if (self = [super init]) {
        self.$registryId = registryId;
    }
    return self;
}
+ (void)initialize {
    if (self == [AliasTestClass class]) {
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
        if ((CJImpl_ObjC_cjworld_BaseClass_fwd_init___Puml = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_BaseClass_fwd_init___Puml")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_BaseClass_fwd_init___Puml symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_BaseClass_fwd_compute = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_BaseClass_fwd_compute")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_BaseClass_fwd_compute symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_BaseClass_fwd_deleteCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_BaseClass_fwd_deleteCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_BaseClass_fwd_deleteCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_BaseClass_fwd_lockCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_BaseClass_fwd_lockCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_BaseClass_fwd_lockCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_BaseClass_fwd_unlockCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_BaseClass_fwd_unlockCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_BaseClass_fwd_unlockCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_AliasTestClass_init = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_AliasTestClass_init")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_AliasTestClass_init symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_DerivedClass_init_l = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_DerivedClass_init_l")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_DerivedClass_init_l symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_AliasTestClass_deleteCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_AliasTestClass_deleteCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_AliasTestClass_deleteCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_BaseClass_deleteCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_BaseClass_deleteCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_BaseClass_deleteCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_DerivedClass_deleteCJObject = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_DerivedClass_deleteCJObject")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_DerivedClass_deleteCJObject symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_AliasTestClass_testIntAlias_l = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_AliasTestClass_testIntAlias_l")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_AliasTestClass_testIntAlias_l symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_AliasTestClass_testBoolAlias_b = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_AliasTestClass_testBoolAlias_b")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_AliasTestClass_testBoolAlias_b symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_AliasTestClass_testMixedAlias__lb = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_AliasTestClass_testMixedAlias__lb")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_AliasTestClass_testMixedAlias__lb symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_BaseClass_compute = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_BaseClass_compute")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_BaseClass_compute symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_DerivedClass_compute = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_DerivedClass_compute")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_DerivedClass_compute symbol in cjworld");
            exit(1);
        }
        if ((CJImpl_ObjC_cjworld_DerivedClass_getMyAliasTestClass_CN7cjworld14AliasTestClassE = dlsym(CJWorldDLHandle, "CJImpl_ObjC_cjworld_DerivedClass_getMyAliasTestClass_CN7cjworld14AliasTestClassE")) == NULL) {
            NSLog(@"ERROR: Failed to find CJImpl_ObjC_cjworld_DerivedClass_getMyAliasTestClass_CN7cjworld14AliasTestClassE symbol in cjworld");
            exit(1);
        }
    }
}
- (int64_t)testIntAlias:(int64_t)val {
    return CJImpl_ObjC_cjworld_AliasTestClass_testIntAlias_l(self.$registryId, val);
}
- (BOOL)testBoolAlias:(BOOL)flag {
    return CJImpl_ObjC_cjworld_AliasTestClass_testBoolAlias_b(self.$registryId, flag);
}
- (int64_t)testMixedAlias:(int64_t)val :(BOOL)flag {
    return CJImpl_ObjC_cjworld_AliasTestClass_testMixedAlias__lb(self.$registryId, val, flag);
}
- (void)deleteCJObject {
     CJImpl_ObjC_cjworld_AliasTestClass_deleteCJObject(self.$registryId);
}
- (void)dealloc {
    [self deleteCJObject];
}
@end
