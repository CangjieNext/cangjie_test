/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"

@implementation M

static int64_t _p2;

- (void)f1:(int64_t)a0 {
    printf("in objc f1: %lld\n", a0);
}

+ (void)f2:(int64_t)a0 {
    printf("in objc f2: %lld\n", a0);
}

+ (int64_t)p2 {
    return _p2;
}

+ (void)setP2:(int64_t)p2 {
    _p2 = p2;
}

- (id)init {
    if (self = [super init]) {
        _p1 = 0;
        printf("in objc init\n");
    }
    return self;
}

@end
