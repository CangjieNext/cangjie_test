// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import "Cangjie.h"
#import <dlfcn.h>
#import <stdlib.h>
#import <assert.h>
#import "Base.h"
#import "Derived.h"

static void* CJWorldDLHandle = NULL;
static struct RuntimeParam defaultCJRuntimeParams = {0};

extern int cangjieMain();

int main(int argc, char** argv) {
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
    @autoreleasepool {
        Base* b = [[Base alloc] init];
        Base* d = [[Derived alloc] init];
        assert([b foo] == 1);
        assert([d foo] == 2);
    }
    return 0;
}
