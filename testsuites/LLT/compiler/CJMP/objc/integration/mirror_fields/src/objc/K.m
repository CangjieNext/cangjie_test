// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "K.h"

@implementation K
- (id) init {
    if (self = [super init]) {
        printf("objc: [K init]\n");
    }
    version = 0;

    return self;
}

-(id) initWithVersion:(long)versionArg {
    if (self = [super init]) {
        printf("objc: [K initWithVersion], version: %ld\n", versionArg);
    }
    version = versionArg;

    return self;
}

- (void) foo {
    printf("objc: [K foo]\n");
}
@end