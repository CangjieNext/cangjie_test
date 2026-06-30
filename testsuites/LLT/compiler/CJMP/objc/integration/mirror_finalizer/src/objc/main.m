// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    int64_t leaked;

    @autoreleasepool {
        A* a = [[A alloc] init];

        int64_t before = [a test];
        // we could count leaked after pool drained, but it will require
        // taking `a` instance into account
        leaked = [M counter] - before;
    }

    return (int)leaked;
}
