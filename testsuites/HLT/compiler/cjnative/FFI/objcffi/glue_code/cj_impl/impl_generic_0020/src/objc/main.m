/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "AInt64.h"
#import "ABool.h"
#import "AFloat64.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        AInt64* a1 = [[AInt64 alloc] init];
        ABool* a2 = [[ABool alloc] init];
        AFloat64* a3 = [[AFloat64 alloc] init];
        printf("in oc, %lld\n", [a1 f: 1]);
        printf("in oc, %s\n", [a2 f: true]?"true":"false");
        printf("in oc, %.1f\n", [a3 f: 1.0]);
    }
    return 0;
}
