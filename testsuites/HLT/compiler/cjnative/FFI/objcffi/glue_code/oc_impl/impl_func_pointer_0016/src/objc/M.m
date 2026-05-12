/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"
struct S s;
struct S f() {
    s.x = 1;
    s.y = 1;
    return s;
}
@implementation M
- (id)init {
    if (self = [super init]) {
        self->fptr = f;
    }
    return self;
}
@end
