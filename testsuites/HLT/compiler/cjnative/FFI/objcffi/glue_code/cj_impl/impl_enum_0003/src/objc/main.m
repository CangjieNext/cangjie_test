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
        [[A EBool: true] f];
        [[A Eu8: 1] f];
        [[A Eu16: 1] f];
        [[A Eu32: 1] f];
        [[A Eu64: 1] f];
        [[A EuN: 1] f];
        [[A Ef32: 3.15] f];
        [[A Ef64: 3.14] f];
    }
    return 0;
}
