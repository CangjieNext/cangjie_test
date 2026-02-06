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
        [a f8: 8];
        [a f16: 16];
        [a f32: 32];
        [a f64: 64];
        [a fN: 128];

        [A stf8: 8];
        [A stf16: 16];
        [A stf32: 32];
        [A stf64: 64];
        [A stfN: 128];
    }
    return 0;
}
