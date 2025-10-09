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
        [a f1:1];
        [A f2:2];
        a.p1 = 3;
        A.p2 = 4;
        printf("in objc main, p1: %lld\n", a.p1);
        printf("in objc main, p2: %lld\n", A.p2);
    }
    return 0;
}
