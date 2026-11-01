// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import "B.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    printf("objc: main\n");

    @autoreleasepool {
        A* a = [[A alloc] initWithValue:7];

        // Objective-C keeps holding `a` across every crossing, so the peer has to survive all of them
        // together with the collections in between.
        for (int i = 0; i < 5; i++) {
            printf("objc: take = %lld\n", (long long)[B take:a]);
            [B collect];
        }

        printf("objc: still alive = %lld\n", (long long)[a value]);
    }

    printf("objc: main end\n");
    return 0;
}
