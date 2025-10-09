// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation M

- (id)init {
    if (self = [super init]) {
        printf("objc: [M init]\n");
    }

    return self;
}

- (M1*)foo {
    printf("objc: [[M1 alloc] init] from [M foo]\n");
    return [[M1 alloc] init];
}

- (int32_t)goo {
    printf("objc: [M goo]\n");

    return 42;
}

@end
