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
        [a foo];
        [a foo :1];
        [a foo :16 :32];
        [a foo :8 :128 :129];
        [a foo :9 :17 :33 :65 :3.15];

        printf("in oc got %d\n", [a getI8: 8]);
        printf("in oc got %hd\n", [a getI16: 16]);
        printf("in oc got %d\n", [a getI32: 32]);
        printf("in oc got %lld\n", [a getI64: 64]);
        printf("in oc got %zd\n", [a getIN: 128]);

        printf("in oc got %u\n", [a getUI8: 9]);
        printf("in oc got %hu\n", [a getUI16: 17]);
        printf("in oc got %u\n", [a getUI32: 33]);
        printf("in oc got %llu\n", [a getUI64: 65]);
        printf("in oc got %zu\n", [a getUIN: 129]);

        printf("in oc got %s\n", [a getBool: true]?"true":"false");
        printf("in oc got %f\n", [a getF32: 3.15]);
        printf("in oc got %f\n", [a getF64: 3.14]);
    }
    return 0;
}
