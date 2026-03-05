// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation M
{
    int32_t _baz;
}

@synthesize foo;
@synthesize bar;
@synthesize baz;
@synthesize _qux;
@synthesize _car;
@synthesize _map;

static int32_t _hat = 0;

- (id)init {
    if (self = [super init]) {
        printf("objc: [M init]\n");

        [self updateFoo:0];
        [self setBar:0];
        [self applyBaz:0];
        [self set_qux:false];
        [self writeCar:0];
        [self sendMap:0];
    }

    return self;
}

- (int32_t)baz {
    printf("objc: baz get\n");
    return _baz;
}

- (void)applyBaz:(int32_t)value {
    printf("objc: baz set\n");
    _baz = value;
}


+ (int32_t)takeHat {
    printf("objc: hat get\n");
    return _hat;
}

+ (void)putHat:(int32_t)value {
    printf("objc: hat set\n");
    _hat = value;
}

@end
