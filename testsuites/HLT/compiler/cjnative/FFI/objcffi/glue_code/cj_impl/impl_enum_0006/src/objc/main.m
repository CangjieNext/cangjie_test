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
        A* a1 = [A E1: 1];
        A* a2 = [A E2: true];
        A* a3 = [A E3: a1];
        [a1 f];
        [a2 f];
        [a3 f];
    }
    return 0;
}
