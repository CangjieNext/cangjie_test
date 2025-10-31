/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>


int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];
        struct S s1 = {1, 1};
        struct S s2 = [a foo: s1];
        printf("in objc main, %d\n", s2.x + s2.y);
    }
    return 0;
}
