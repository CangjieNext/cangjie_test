/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"

@implementation M

static int _a;

+ (int)a {
    return _a;
}

+ (void)setA:(int)a {
    _a = a;
}

- (id)init {
    if (self = [super init]) {
        [M setA:1];
        printf("in objc init\n");
    }
    return self;
}

@end
