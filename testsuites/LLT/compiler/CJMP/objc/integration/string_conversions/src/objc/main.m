/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <stdlib.h>
#import <Foundation/Foundation.h>

// Interoplib objc common code
extern bool initCJRuntime(const char*);

extern int cangjieMain();

int main(int argc, char** argv) {
    if (!initCJRuntime("libcjworld.dylib")) {
        exit(1);
    }

    @autoreleasepool {
        return cangjieMain();
    }

    return 0;
}
