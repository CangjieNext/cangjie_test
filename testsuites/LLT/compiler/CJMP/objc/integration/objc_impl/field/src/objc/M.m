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

- (void) identity {
    printf("objc: I'm a class M instance\n");
}

@end

@implementation M1

- (id)init {
    if (self = [super init]) {
        printf("objc: [M1 init]\n");
    }

    return self;
}

- (void) identity {
    printf("objc: I'm a class M1 instance\n");
}

@end
