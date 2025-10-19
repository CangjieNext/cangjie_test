// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>

/*
Mirror      Impl
  M    ->    A
  K    ->    L

M:
 - long x > primitive
 - K*   k > mirror
 - L*   l > impl

K:
-(void)foo

L:
-(void)bar
*/

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];
        printf("Accessing public field of Mirror through Impl: value of x is %ld\n", a->x);
        a->x += 123;
        printf("Modified public field of Mirror through Impl: new value of x is %ld\n", a->x);

        printf("Calling method on Mirror class which is property of Mirror, through Impl: ");
        [a->k foo];
        printf("Calling method on Impl class which is property of Mirror, through Impl: ");
        [a->l bar];
        
        [a modify];
    }
    return 0;
}
