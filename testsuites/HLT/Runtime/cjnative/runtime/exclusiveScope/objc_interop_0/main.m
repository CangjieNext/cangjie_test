/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>
#import <dlfcn.h>
#import <Cangjie.h>
#import <stdio.h>

extern void cj_main();

static void *CJWorldDLHandle = NULL;
static struct RuntimeParam defaultCJRuntimeParam = {0};

@interface A : NSObject
+ (instancetype) bar;
@end

@implementation A
+ (instancetype) bar {
    return [[A alloc] init];
}
@end

int main(int argc, char **argv) {
    if (InitCJRuntime(&defaultCJRuntimeParam) != E_OK) {
        NSLog(@"ERROR: Failed to init Cangjie Runtime.");
        exit(1);
    }
    if (LoadCJLibraryWithInit("libpack.dylib") != E_OK) {
        NSLog(@"ERROR: Failed to load Cangjie Library.");
        exit(1);
    }
    if ((CJWorldDLHandle = dlopen("libpack.dylib", RTLD_LAZY)) == NULL) {
        NSLog(@"ERROR: Failed to dlopen Cangjie Library.");
        NSLog(@"%s", dlerror());
        exit(1);
    }
    @autoreleasepool {
        cj_main();
    }
    return 0;
}
