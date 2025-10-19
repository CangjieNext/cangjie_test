// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"
#import "K.h"
#import "L.h"

@implementation M
- (id)getLInstance:(long)versionArg {
    return [[L alloc] initWithVersion:versionArg];
}

- (id)init {
    if (self = [super init]) {
        printf("objc: [M init]\n");
    }
    self->x = 123;
    k = [[K alloc] initWithVersion:1];
    l = [[L alloc] initWithVersion:1];
    
    return self;
}

@end
