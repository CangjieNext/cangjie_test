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
        M* m = [[M alloc] init];

        A* a11 = [[A alloc] initWithB:m];
        [a11 check];
         
        A* a21 = [[A alloc] initWithA:m andB:m];
        [a21 check];

        A* a31 = [[A alloc] initWithA:m andB:5 andD:m];
        [a31 check];
        A* a32 = [[A alloc] initWithA:m andB:10 andD:m];
        [a32 check];

        printf("objc: main end\n");
    }
    return 0;
}
