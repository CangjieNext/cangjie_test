/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "AInt64.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        AInt64* a1 = [[AInt64 alloc] init: 1];
        AInt64* a2 = [[AInt64 alloc] init: 1: 1];
        printf("in oc, %lld\n", [a1 f1: 1]);
        printf("in oc, %lld\n", [a2 f2: 1]);
    }
    return 0;
}
