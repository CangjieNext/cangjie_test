#import "A.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];
        struct Point2D point = { .x = 42, .y = 42 };

        struct Point2D returnedPoint = [a printPointCJ:point];
        printf("objc: returned point %f %f\n", returnedPoint.x, returnedPoint.y);

        [a testPrintThroughOC];
    }
    return 0;
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

