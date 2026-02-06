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
        printf("in oc main, %lld\n", A.a);

        printf("in oc main, %d\n", A.a8);
        printf("in oc main, %hd\n", A.a16);
        printf("in oc main, %d\n", A.a32);
        printf("in oc main, %lld\n", A.a64);
        printf("in oc main, %zd\n", A.aN);

        printf("in oc main, %u\n", A.u8);
        printf("in oc main, %hu\n", A.u16);
        printf("in oc main, %u\n", A.u32);
        printf("in oc main, %llu\n", A.u64);
        printf("in oc main, %zu\n", A.uN);

        printf("in oc main, %s\n", A.aB?"true":"false");
        printf("in oc main, %f\n", A.f32);
        printf("in oc main, %f\n", A.f64);
    }
    return 0;
}
