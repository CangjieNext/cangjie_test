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
        printf("objc: run = %lld\n", (long long)[B run]);

        A* a = [[A alloc] init];
        B* b = [[B alloc] init];
        A* bAsA = b;

        printf("objc: a tag = %lld\n", (long long)[a tag]);
        printf("objc: b tag = %lld\n", (long long)[b tag]);
        printf("objc: bAsA tag = %lld\n", (long long)[bAsA tag]);

        printf("objc: b stamp = %lld\n", (long long)[b stampValue]);

        printf("objc: bumpShared = %lld\n", (long long)[b bumpShared]);
        printf("objc: bumpShared = %lld\n", (long long)[b bumpShared]);
    }

    printf("objc: trace = %lld\n", (long long)[A trace]);
    printf("objc: main end\n");
    return 0;
}
