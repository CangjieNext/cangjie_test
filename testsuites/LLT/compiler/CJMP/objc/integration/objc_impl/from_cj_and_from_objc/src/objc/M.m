// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation M

- (id)initWithA:(int64_t)_a andB:(double)_b {
    if (self = [super init]) {
        printf("objc: [M initWithA:%lld andB:%lf]\n", _a, _b);
        self->a = _a;
        self->b = _b;
    }

    return self;
}

@end
