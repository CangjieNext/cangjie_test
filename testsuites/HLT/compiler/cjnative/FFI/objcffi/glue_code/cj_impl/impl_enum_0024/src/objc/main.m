/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>

void g(A* a) {[a f];}
int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [A E1];
        g(a);
    }
    return 0;
}
