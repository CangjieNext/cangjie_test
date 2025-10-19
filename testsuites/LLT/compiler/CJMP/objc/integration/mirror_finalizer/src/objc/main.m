// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    int64_t counter;
    @autoreleasepool {
        A* a = [[A alloc] init];
        counter = [a test];
    }

    int64_t mCounter = [M counter];
    if (counter - 1 == mCounter) {
        return 0;
    }

    return counter;
}
