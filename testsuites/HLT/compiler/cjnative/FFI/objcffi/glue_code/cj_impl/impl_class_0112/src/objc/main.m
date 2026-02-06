/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>

@interface M1 : A
@end
@implementation M1
@end
@interface M2 : A
+ (void)f;
+ (void)g;
@end
@implementation M2
+ (void)f { printf("in oc\n"); }
+ (void)g { [A f]; };
@end
int main(int argc, char** argv) {
    @autoreleasepool {
        [A f];
        [M1 f];
        [M2 f];
        [M2 g];

        printf("in st oc, %s\n", [A fBool: true]?"true":"false");
        printf("in st oc, %d\n", [A f8: 8]);
        printf("in st oc, %hd\n", [A f16: 16]);
        printf("in st oc, %d\n", [A f32: 32]);
        printf("in st oc, %lld\n", [A f64: 64]);
        printf("in st oc, %zd\n", [A fN: 128]);
        printf("in st oc, %u\n", [A fU8: 9]);
        printf("in st oc, %hu\n", [A fU16: 17]);
        printf("in st oc, %u\n", [A fU32: 33]);
        printf("in st oc, %llu\n", [A fU64: 65]);
        printf("in st oc, %zu\n", [A fUN: 129]);
        printf("in st oc, %f\n", [A ff32: 3.15]);
        printf("in st oc, %f\n", [A ff64: 3.14]);
    }
    return 0;
}
