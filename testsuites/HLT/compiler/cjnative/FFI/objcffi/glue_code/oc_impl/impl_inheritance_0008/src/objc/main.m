/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "B.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        B* b = [[B alloc] init];
        int64_t a = b.a1 + b.b1 + b.p1 + b.p2 + b.p3 + [b f1] + [b f2] + [b f3];
        a = a + B.a2 + B.b2 + B.s_p1 + B.s_p2 + B.s_p3 + [B s_f1] + [B s_f2] + [B s_f3];
        a = a + b->v + b.p + [b f];
        printf("in oc, %lld\n", a);
    }
    return 0;
}
