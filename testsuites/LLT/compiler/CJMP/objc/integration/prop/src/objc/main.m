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
        a.b = [[M1 alloc] initWithAnswer: 3.55];
        printf("objc: value of b.answer after set: %lf\n", a.b.answer);
        printf("objc: value of c: %s\n", a.c ? "YES" : "NO");

        printf("objc: value of A.e: %lf\n", A.e);
        printf("objc: value of A.f: %lf\n", A.f);
        A.f = 4.33;
        printf("objc: value of A.f after set: %lf\n", A.f);

        printf("objc: value of A.g.answer: %lf\n", A.g.answer);
        printf("objc: value of A.h.answer: %lf\n", A.h.answer);
        A.h = [[M1 alloc] initWithAnswer: A.h.answer * 2];
        printf("objc: value of A.h.answer after set: %lf\n", A.h.answer);
    }
    return 0;
}
