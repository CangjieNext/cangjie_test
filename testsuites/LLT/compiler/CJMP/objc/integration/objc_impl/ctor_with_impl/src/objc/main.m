// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        printf("objc: main\n");
        A* a = [[A alloc] initWithValue:2];
        [a printValue];

        A* a11 = [[A alloc] initWithB:a];
        [a11 printValue];
         
        A* a21 = [[A alloc] initWithA:a andB:a];
        [a21 printValue];

        A* a31 = [[A alloc] initWithA:a andB:5 andD:a];
        [a31 printValue];
        A* a32 = [[A alloc] initWithA:a21 andB:10 andD:a31];
        [a32 printValue];

        printf("objc: main end\n");
    }
    return 0;
}
