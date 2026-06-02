/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "B.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];
        B* b = [a foo];
        printf("in oc main, %lld\n", b.a);

        printf("in oc main, %d\n", b.a8);
        printf("in oc main, %hd\n", b.a16);
        printf("in oc main, %d\n", b.a32);
        printf("in oc main, %lld\n", b.a64);
        printf("in oc main, %zd\n", b.aN);

        printf("in oc main, %u\n", b.u8);
        printf("in oc main, %hu\n", b.u16);
        printf("in oc main, %u\n", b.u32);
        printf("in oc main, %llu\n", b.u64);
        printf("in oc main, %zu\n", b.uN);

        printf("in oc main, %s\n", b.aB?"true":"false");
        printf("in oc main, %f\n", b.f32);
        printf("in oc main, %f\n", b.f64);
    }
    return 0;
}
