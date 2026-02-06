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
        printf("in oc main, %lld\n", A.p);

        printf("in oc main, %d\n", A.p8);
        printf("in oc main, %hd\n", A.p16);
        printf("in oc main, %d\n", A.p32);
        printf("in oc main, %lld\n", A.p64);
        printf("in oc main, %zd\n", A.pN);

        printf("in oc main, %u\n", A.pu8);
        printf("in oc main, %hu\n", A.pu16);
        printf("in oc main, %u\n", A.pu32);
        printf("in oc main, %llu\n", A.pu64);
        printf("in oc main, %zu\n", A.puN);

        printf("in oc main, %s\n", A.pB?"true":"false");
        printf("in oc main, %f\n", A.pf32);
        printf("in oc main, %f\n", A.pf64);

        printf("in oc main, %d\n", A.stp8);
        printf("in oc main, %hd\n", A.stp16);
        printf("in oc main, %d\n", A.stp32);
        printf("in oc main, %lld\n", A.stp64);
        printf("in oc main, %zd\n", A.stpN);

        printf("in oc main, %u\n", A.stu8);
        printf("in oc main, %hu\n", A.stu16);
        printf("in oc main, %u\n", A.stu32);
        printf("in oc main, %llu\n", A.stu64);
        printf("in oc main, %zu\n", A.stuN);

        printf("in oc main, %s\n", A.stpB?"true":"false");
        printf("in oc main, %f\n", A.stpf32);
        printf("in oc main, %f\n", A.stpf64);
    }
    return 0;
}
