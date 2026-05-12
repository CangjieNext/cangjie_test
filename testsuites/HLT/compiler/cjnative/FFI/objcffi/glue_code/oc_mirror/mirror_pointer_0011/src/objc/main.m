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
        int64_t *ret1 = a.p1;
        int64_t *ret2 = a.p2;
        printf("in objc main, %lld\n", *ret1);
        printf("in objc main, %lld\n", *ret2);
    }
    return 0;
}
