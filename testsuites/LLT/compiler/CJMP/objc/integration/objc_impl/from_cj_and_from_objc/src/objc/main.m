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
        A* fromObjC = [[A alloc] init];
        A* fromCj = [A check: fromObjC];
        NSCAssert(fromObjC->a == fromCj->a, @"fromObjC->a != fromCj->a");
        NSCAssert(fromObjC->b == fromCj->b, @"fromObjC->b != fromCj->b");
        printf("objc: main end\n");
    }
    return 0;
}
