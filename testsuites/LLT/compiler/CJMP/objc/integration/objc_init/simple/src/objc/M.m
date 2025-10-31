// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation M

- (id)init {
    if (self = [super init]) {
        printf("objc: [M init]\n");
    }

    return self;
}

- (id)init:(BOOL) b {
    if (self = [super init]) {
        printf("objc: [M init:%s]\n", b ? "true" : "false");
    }
    return self;
}

- (id)init:(BOOL) boo andBool:(BOOL) b {
    if (self = [super init]) {
        printf("objc: [M init:%s andBool:%s]\n", boo ? "true" : "false", b ? "true" : "false");
    }
    
    return self;
}

@end

