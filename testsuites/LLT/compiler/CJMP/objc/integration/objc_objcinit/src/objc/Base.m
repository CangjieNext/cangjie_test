// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Base.h"

@implementation Base

- (id)init:(int) b {
    if (self = [super init]) {
        printf("objc: [M init:%d]\n", b);
    }
    self->x = b;

    return self;
}

- (id)initWithB:(int) b {
    if (self = [super init]) {
        printf("objc: [M initWithB:%d]\n", b);
    }
    self->x = b;

    return self;
}

- (void)baseTest {
    printf("objc: [baseTest: %d]\n", self->x);
}

@end
