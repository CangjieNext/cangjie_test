/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M2.h"

@implementation M2

- (id)initWithA:(int64_t)a AndB:(bool)b AndC:(M1*)c {
    if ((self = [super init]) && b && ![c foo]) {
        printf("in objc M2 init, a: %lld\n", a);
    }
    return self;
}

@end
