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
        printf("in oc, %d\n", a.p8);
        printf("in oc, %hd\n", a.p16);
        printf("in oc, %d\n", a.p32);
        printf("in oc, %lld\n", a.p64);
        printf("in oc, %zd\n", a.pN);

        printf("in oc st, %d\n", A.stP8);
        printf("in oc st, %hd\n", A.stP16);
        printf("in oc st, %d\n", A.stP32);
        printf("in oc st, %lld\n", A.stP64);
        printf("in oc st, %zd\n", A.stPN);
    }
    return 0;
}
