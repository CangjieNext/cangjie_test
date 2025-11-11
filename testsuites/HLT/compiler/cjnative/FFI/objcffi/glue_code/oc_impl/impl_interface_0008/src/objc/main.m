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
        printf("p1, %lld\n", a.v.p1);
        printf("p1, %lld\n", a.p.p1);
        [a g2:[a g1]];
    }
    return 0;
}
