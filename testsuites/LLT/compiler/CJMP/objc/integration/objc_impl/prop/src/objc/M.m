// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation M

- (id)init {
    if (self = [super init]) {
        printf("objc: M.init()\n");
        self.value = 5;
    }

    return self;
}

- (id)initWithValue:(int64_t)value {
    if (self = [super init]) {
        printf("objc: M.initWithValue(%ld)\n", value);
        self.value = value;
    }
    return self;
}

@end
