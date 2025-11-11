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

- (id)init:(int64_t)a {
    if (self = [super init]) {
        _a = a;
    }
    return self;
}

+ (int64_t)f:(id)a {
    return ((M) a).a;
}

@end
