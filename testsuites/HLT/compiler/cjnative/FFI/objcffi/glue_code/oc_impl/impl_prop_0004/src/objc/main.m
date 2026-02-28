/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "M1.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];
        printf("in objc main, %lld\n", a.p->a);
        a.p = [[M1 alloc] init: 321];
        printf("in objc main, %lld\n", a.p->a);
    }
    return 0;
}
