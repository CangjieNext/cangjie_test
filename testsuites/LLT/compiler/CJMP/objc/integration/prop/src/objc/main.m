// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>


int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];

        printf("objc: value of foo: %lld\n", a.foo);
        printf("objc: value of bar.answer: %lf\n", a.bar.answer);
        printf("objc: value of a: %lld\n", a.a);
        printf("objc: value of b.answer: %lf\n", a.b.answer);
        printf("objc: value of c: %s\n", a.c ? "YES" : "NO");
    }
    return 0;
}
