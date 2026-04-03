/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "NonOpen.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [A E1];
        NonOpen* s = [[NonOpen alloc] init: a];
        a = [NonOpen stF: a];
        a = [s implicitF: a];
        a = [s f: a];
        [a f];
    }
    return 0;
}
