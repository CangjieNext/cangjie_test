// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M1.h"

@implementation M1
-(id)initWithValue: (int64_t)value {
    if (self = [super init]) {
        printf("objc: [M1 initWithValue:%ld]\n", value);
        self->value = value;
    }

    return self;
}
-(void) identity {
    printf("objc: I'm a class M1 instance, self->value=%ld\n", self->value);
}
@end