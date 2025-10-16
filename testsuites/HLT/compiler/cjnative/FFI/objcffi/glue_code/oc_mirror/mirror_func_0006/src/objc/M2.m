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
    if (self = [super init]) {
        printf("in objc M2 init\n");
    }
    return self;
}

- (M1*)goo {
    printf("in objc M2 goo\n");
    M1* m = [[M1 alloc] init];
    return m;
}

@end
