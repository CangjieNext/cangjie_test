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
        A* a1 = [[A alloc] init: 123];
        A* a2 = [[A alloc] init: 321];
        B* b = [[B alloc] init: a1];
        A* a = [b test: a2];
        printf("in objc main, test: %lld\n", a.a);
        printf("in objc main, b.a: %lld\n", b.a.a);
    }
    return 0;
}
