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
        M* m = [[M alloc] init];
        [m f1:1];
        [M f2:2];
        m.p1 = 3;
        M.p2 = 4;
        printf("in objc main, p1: %lld\n", m.p1);
        printf("in objc main, p2: %lld\n", M.p2);
    }
    return 0;
}
