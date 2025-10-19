// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation M

- (id)initWithValue:(int64_t)value {
    if (self = [super init]) {
        printf("objc: M.initWithValue(%ld)\n", value);
        self.value = value;
    }
    return self;
}

- (id)initWithB:(BOOL)b {
    if (self = [super init]) {
        printf("objc: M.initWithB(%d)\n", b);
        self.value = b ? 1 : 0;
    }
    return self;
}
- (id)initWithM:(M*)m andB:(BOOL)b {
    if (self = [super init]) {
        printf("objc: M.initWithM:andB(%ld, %d)\n", m.value, b);
        self.value = m.value + (b ? 1 : 0);
    }
    return self;
}
- (id)initWithA:(M*) a andM:(M*) m {
    if (self = [super init]) {
        printf("objc: M.initWithA:andM(%ld, %ld)\n", a.value, m.value);
        self.value = a.value + m.value;
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        printf("objc: M()\n");
    }
    return self;
}

@end
