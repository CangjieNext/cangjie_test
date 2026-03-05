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
        A* a1 = [[A alloc] init:2 :4];
        A* a2 = [[A alloc] init:1 :1];
        printf("in oc main, %lld\n", [a1 dot:a2]);
        A* a3 = [a1 add:a2];
        printf("in oc main, %d\n", a3.x);
        [A processPrimitive:3 :1.11 :true];
        A* a4 = [A processA: a2];
        printf("in oc main, %d\n", a4.y);
    }
    return 0;
}
