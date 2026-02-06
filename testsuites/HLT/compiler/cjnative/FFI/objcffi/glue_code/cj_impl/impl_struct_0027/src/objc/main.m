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
        [A foo];
        [A foo :1];
        [A foo :16 :32];
        [A foo :8 :128 :129];
        [A foo :9 :17 :33 :65 :3.15 :3.14 :true];

        printf("in oc got %d\n", [A getI8: 8]);
        printf("in oc got %hd\n", [A getI16: 16]);
        printf("in oc got %d\n", [A getI32: 32]);
        printf("in oc got %lld\n", [A getI64: 64]);
        printf("in oc got %zd\n", [A getIN: 128]);

        printf("in oc got %u\n", [A getUI8: 9]);
        printf("in oc got %hu\n", [A getUI16: 17]);
        printf("in oc got %u\n", [A getUI32: 33]);
        printf("in oc got %llu\n", [A getUI64: 65]);
        printf("in oc got %zu\n", [A getUIN: 129]);

        printf("in oc got %s\n", [A getBool: true]?"true":"false");
        printf("in oc got %f\n", [A getF32: 3.15]);
        printf("in oc got %f\n", [A getF64: 3.14]);
    }
    return 0;
}
