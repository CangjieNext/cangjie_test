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
        A* a11 = [[A alloc] initWithB:true];
        [a11 check];
        A* a12 = [[A alloc] initWithB:false];
        [a12 check];
         
        A* a21 = [[A alloc] initWithI:7];
        [a21 check];
        
        A* a31 = [[A alloc] initWithA:7 andB:true];
        [a31 check];
        A* a32 = [[A alloc] initWithA:3 andB:false];
        [a32 check];

        A* a41 = [[A alloc] initWithA:3 andB:false andD:5];
        [a41 check];
        A* a42 = [[A alloc] initWithA:1 andB:true andD:7];
        [a42 check];

        printf("objc: main end\n");
    }
    return 0;
}
