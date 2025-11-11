/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M1.h"

@implementation M1
- (id)init:(int64_t)a {
    if (self = [super init]) {
        _p1 = a;
    }
    return self;
}
- (void)f1 {
    printf("in objc f1\n");
}
- (void)f3 {
    printf("in objc f3\n");
}
@end
