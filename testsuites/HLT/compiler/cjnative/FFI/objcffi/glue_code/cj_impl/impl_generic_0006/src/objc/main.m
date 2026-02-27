/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "AInt64BoolFloat64.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        AInt64BoolFloat64* a = [[AInt64BoolFloat64 alloc] init: 1: true: 1.0];
        printf("in oc, %lld\n", [a f1: 1: 1.0: true]);
        printf("in oc, %s\n", [a f2: 1.0: true: 1]?"true":"false");
        printf("in oc, %.1f\n", [a f3: true: 1: 1.0]);
    }
    return 0;
}
