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
        A* a = [[A alloc] init: 10];
        A* a0 = [a foo: 12];
        signed char result = [a0 getValue];
        printf("result = %hhd\n", result);
        A* a1 = [[A alloc] init: 128: 129];
        printf("result = %hhd\n", [a1 getValue]);
        printf("result N = %zd\n", [a1 getValueN: 228]);
        printf("result UN = %zu\n", [a1 getValueUN: 229]);
    }
    return 0;
}
