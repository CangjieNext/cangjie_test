/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M1.h"
void f(int64_t a) {printf("in oc f, %lld\n", a);}
@implementation M1
- (id)init {
    if (self = [super init]) {
        self->fptr = f;
    }
    return self;
}
@end
