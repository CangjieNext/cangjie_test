// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import "A2.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        [[[A2 alloc] init] runFromCJ];
        // [[A alloc] init];
    }
    return 0;
}
