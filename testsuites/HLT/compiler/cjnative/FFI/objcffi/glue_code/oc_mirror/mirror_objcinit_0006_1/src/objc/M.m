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
    return [super init];
}
- (id)initWithA:(int64_t)a AndB:(int64_t)b AndC:(int64_t)c {
    if (self = [super init]) {
        printf("in objc initWithAAndBAndC, a: %lld\n", a+b+c);
    }
    return self;
}
- (id)initWithA1:(int64_t)a AndB:(int64_t)b AndC:(int64_t)c {
    if (self = [super init]) {
        printf("in objc initWithA1AndBAndC, a: %lld\n", a+b+c);
    }
    return self;
}

@end
