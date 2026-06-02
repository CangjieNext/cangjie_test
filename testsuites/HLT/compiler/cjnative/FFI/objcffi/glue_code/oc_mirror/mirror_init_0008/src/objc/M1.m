/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M1.h"

@implementation M1

- (id)init {
    if (self = [super init]) {
        printf("in objc M1 init\n");
    }
    return self;
}

- (bool)foo:(bool) a {
    printf("in objc M1 foo\n");
    return a;
}

@end
