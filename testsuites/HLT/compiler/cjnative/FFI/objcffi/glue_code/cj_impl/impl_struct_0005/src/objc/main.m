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
        A* a1 = [[A alloc] init:8];
        A* a2 = [[A alloc] init:16 :32];
        A* a3 = [[A alloc] init:1 :3.14 :true];
        A* a4 = [[A alloc] init:9 :17 :33 :65 :128 :129 :3.15];
    }
    return 0;
}
