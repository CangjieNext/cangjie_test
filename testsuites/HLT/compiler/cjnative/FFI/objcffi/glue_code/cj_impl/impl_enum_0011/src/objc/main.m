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
        printf("in oc, %d\n", [a getI8]);
        printf("in oc, %hd\n", [a getI16]);
        printf("in oc, %d\n", [a getI32]);
        printf("in oc, %lld\n", [a getI64]);
        printf("in oc, %zd\n", [a getIN]);

        printf("in oc implicit, %d\n", [a implicit8]);
        printf("in oc implicit, %hd\n", [a implicit16]);
        printf("in oc implicit, %d\n", [a implicit32]);
        printf("in oc implicit, %lld\n", [a implicit64]);
        printf("in oc implicit, %zd\n", [a implicitN]);

        printf("in oc st, %d\n", [A stGetI8]);
        printf("in oc st, %hd\n", [A stGetI16]);
        printf("in oc st, %d\n", [A stGetI32]);
        printf("in oc st, %lld\n", [A stGetI64]);
        printf("in oc st, %zd\n", [A stGetIN]);
    }
    return 0;
}
