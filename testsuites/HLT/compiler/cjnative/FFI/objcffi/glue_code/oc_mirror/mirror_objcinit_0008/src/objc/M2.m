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
    return [super init];
}
- (M1*)initWithA:(int64_t)a {
    if (self = [super init]) {
        printf("in objc initWithA, a: %lld\n", a);
    }
    return self;
}
- (M1*)initWithA1:(int64_t)a {
    if (self = [super init]) {
        printf("in objc initWithA1, a: %lld\n", a);
    }
    return self;
}

@end
