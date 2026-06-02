/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"
int64_t a1 = 123;
int64_t* a2 = &a1;
int64_t* f() {return a2;}
@implementation M
- (id)init {
    if (self = [super init]) {
        self->fptr = f;
    }
    return self;
}
@end
