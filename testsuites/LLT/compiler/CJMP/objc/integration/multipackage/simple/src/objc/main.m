// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import <stdlib.h>
#import <assert.h>
#import "Base.h"
#import "Derived.h"

// Interoplib objc common code
extern bool initCJRuntime(const char*);

extern int cangjieMain();

int main(int argc, char** argv) {
    if (!initCJRuntime("libcjworld.dylib")) {
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
