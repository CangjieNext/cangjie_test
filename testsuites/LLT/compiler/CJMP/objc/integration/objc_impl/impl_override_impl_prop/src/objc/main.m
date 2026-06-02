// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import "A1.h"
#import <Foundation/Foundation.h>


int main(int argc, char** argv) {
    @autoreleasepool {
        printf("objc: main started\n");
        A* a = [[A alloc] init];
        A1* a1 = [[A1 alloc] init];
        printf("objc: a answer: %ld\n", a.answer);
        printf("objc: a1 answer: %ld\n", a1.answer);
        printf("objc: a1 objCAnswer: %ld\n", a1.objCAnswer);
        printf("objc: main finished\n");
    }
    return 0;
}
