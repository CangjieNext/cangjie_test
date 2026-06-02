// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Base.h"
#import "A.h"

@implementation Base

- (id)init {
    if (self = [super init]) {}
    self->x = 0;
    return self;
}

- (Base*)generateNext {
    if (self->x == 5) {
        return NULL;
    } else {
        self->x += 1;
    }
    return [[A alloc] init:self->x];
}

@end
