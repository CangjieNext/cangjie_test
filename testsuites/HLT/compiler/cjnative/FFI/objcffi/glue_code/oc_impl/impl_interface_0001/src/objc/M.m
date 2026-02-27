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
        _p1 = 1;
    }
    return self;
}

- (void)f1 {
    printf("in objc f1\n");
}

- (void)f2 {
    printf("in objc f2\n");
}

- (void)f3 {
    printf("in objc f3\n");
}

@end
