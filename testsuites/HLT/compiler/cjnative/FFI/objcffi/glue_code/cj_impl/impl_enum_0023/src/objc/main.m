/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>

A* g() {return [A E1];}
int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = g();
        [a f];
    }
    return 0;
}
