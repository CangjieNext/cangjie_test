// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        printf("objc: main\n");
        A* a = [[A alloc] init:1];
        printf("objc: [a $registryId] == %ld\n", [a $registryId]);
        A* a1 = [[A alloc] init:2];
        printf("objc: [a1 $registryId] == %ld\n", [a1 $registryId]);
        printf("objc: main end\n");
    }
    return 0;
}
