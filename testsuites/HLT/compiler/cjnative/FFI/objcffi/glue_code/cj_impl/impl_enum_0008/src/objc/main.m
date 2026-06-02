/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [A E1];
        [a getB: true];
        [a getU8: 8];
        [a getU16: 16];
        [a getU32: 32];
        [a getU64: 64];
        [a getUN: 128];
        [a getF32: 3.15];
        [a getF64: 3.14];

        [A stGetB: true];
        [A stGetU8: 8];
        [A stGetU16: 16];
        [A stGetU32: 32];
        [A stGetU64: 64];
        [A stGetUN: 128];
        [A stGetF32: 3.15];
        [A stGetF64: 3.14];
    }
    return 0;
}
