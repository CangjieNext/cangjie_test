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
        [a check];

        // primitive        
        NSCAssert1(A.sVarPrimitive == 100500, @"Expected A.sVarPrimitive == 100500, but got %d", A.sVarPrimitive);
        NSCAssert1(a.varPrimitive == 3228, @"Expected a.varPrimitive == 3228, but got %d", a.varPrimitive);

        // class like
        printf("objc: check [[A sVarInterface] identity]\n");
        [[A sVarInterface] identity];
        printf("objc: check [[a varInterface] identity]\n");
        [[a varInterface] identity];

    }
    return 0;
}
