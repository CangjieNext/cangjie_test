/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M2.h"

@implementation M2

- (id)init {
    if (self = [super init]) {
        v = [[M1 alloc] init:1];
        _p = [[M1 alloc] init:2];
    }
    return self;
}
- (id<I>)g1 {
    return [[M1 alloc] init:3];
}
- (id<I>)g2 {
    return [[M1 alloc] init:4];
}
- (void)g3:(id<I>)a {
    printf("p1: %lld\n", a.p1);
    [a f1];
    [a f3];
}
@end
