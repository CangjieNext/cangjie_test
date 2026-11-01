// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>


int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];
        int32_t* ptr = [a returnPointer];
        printf("objc: *ptr = %d\n", *ptr);

        [a testConstructors];

        [[M alloc] initWithPtr:ptr];
        [[A alloc] initWithAnotherPtr:ptr];
        [[A alloc] initWithTwoPtr:ptr second:ptr];
    }
    return 0;
}