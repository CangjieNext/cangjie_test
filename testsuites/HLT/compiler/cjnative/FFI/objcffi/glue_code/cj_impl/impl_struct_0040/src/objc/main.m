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
        printf("in oc main, %lld\n", a.p);

        printf("in oc main, %d\n", a.p8);
        printf("in oc main, %hd\n", a.p16);
        printf("in oc main, %d\n", a.p32);
        printf("in oc main, %lld\n", a.p64);
        printf("in oc main, %zd\n", a.pN);

        printf("in oc main, %u\n", a.pu8);
        printf("in oc main, %hu\n", a.pu16);
        printf("in oc main, %u\n", a.pu32);
        printf("in oc main, %llu\n", a.pu64);
        printf("in oc main, %zu\n", a.puN);

        printf("in oc main, %s\n", a.pB?"true":"false");
        printf("in oc main, %f\n", a.pf32);
        printf("in oc main, %f\n", a.pf64);
    }
    return 0;
}
