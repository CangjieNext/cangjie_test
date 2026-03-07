// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <objc/runtime.h>
#import "M.h"

@implementation M
- (id) init {
    if (self = [super init]) {
        printf("objc: M init()\n");
    }

    return self;
}

- (void) implemented {
    printf("objc: implemented called\n");
}

- (void) implementedWithArg: (int64_t) i {
    printf("objc: implemented called with %lld\n", (long long)i);
}
@end
