/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"

@implementation M

- (id)init {
    if (self = [super init]) {
        self->a = 123;
        printf("in objc init\n");
    }
    return self;
}

- (int64_t*)goo1 {
    return &a;
}

- (int64_t*)goo2:(int64_t*)p {
    return p;
}

@end
