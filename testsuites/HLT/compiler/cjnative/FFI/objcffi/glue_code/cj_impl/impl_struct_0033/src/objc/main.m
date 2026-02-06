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
        A* a = [[A alloc] init];
        printf("in oc main, %lld\n", a.a);

        printf("in oc main, %d\n", a.a8);
        printf("in oc main, %hd\n", a.a16);
        printf("in oc main, %d\n", a.a32);
        printf("in oc main, %lld\n", a.a64);
        printf("in oc main, %zd\n", a.aN);

        printf("in oc main, %u\n", a.u8);
        printf("in oc main, %hu\n", a.u16);
        printf("in oc main, %u\n", a.u32);
        printf("in oc main, %llu\n", a.u64);
        printf("in oc main, %zu\n", a.uN);

        printf("in oc main, %s\n", a.aB?"true":"false");
        printf("in oc main, %f\n", a.f32);
        printf("in oc main, %f\n", a.f64);
    }
    return 0;
}
