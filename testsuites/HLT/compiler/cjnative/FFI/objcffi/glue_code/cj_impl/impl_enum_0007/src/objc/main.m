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
        [a getI8: 8];
        [a getI16: 16];
        [a getI32: 32];
        [a getI64: 64];
        [a getIN: 128];

        [A stGetI8: 8];
        [A stGetI16: 16];
        [A stGetI32: 32];
        [A stGetI64: 64];
        [A stGetIN: 128];
    }
    return 0;
}
