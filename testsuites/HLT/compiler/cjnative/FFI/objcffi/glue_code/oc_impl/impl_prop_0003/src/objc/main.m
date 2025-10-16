/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "B.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init: 123];
        B* b = [[B alloc] init: a];
        printf("in objc main, %lld\n", b.p.a);
        b.p = [[A alloc] init: 321];
        printf("in objc main, %lld\n", b.p.a);
    }
    return 0;
}
