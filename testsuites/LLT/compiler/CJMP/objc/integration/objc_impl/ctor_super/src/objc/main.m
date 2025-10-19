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
        M* m = [[M alloc] initWithValue:2];

        A* a = [[A alloc] init];
        A* a1 = [[A alloc] initWithA:m];
        A* a2 = [[A alloc] initWithA:a andM:m];

        printf("objc: main end\n");
    }
    return 0;
}
