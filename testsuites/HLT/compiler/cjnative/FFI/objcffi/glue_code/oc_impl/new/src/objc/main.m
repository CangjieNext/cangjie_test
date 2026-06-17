/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>

void f(int64_t a, char *b, struct S c) {
    printf("oc::f: a = %ld, b = %s, c.x = %d, c.y = %d\n", a, b, c.x, c.y);
}

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];
        struct S s = [a foo];
        printf("in objc main, %d\n", s.x + s.y);
        NSString *str1 = @"Hello 仓颉";
        NSString *str2 = [a s1: str1];
        printf("str2 = %s\n", [str2 UTF8String]);
        [a typeCheck: a];
        [a passFunc: f str: @"world"];
    }
    return 0;
}
