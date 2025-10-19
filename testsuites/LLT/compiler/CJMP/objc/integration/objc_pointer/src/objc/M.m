// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

@implementation N
- (id)init {
    if (self = [super init]) {
        self->f = 6.20;
    }

    return self;
}
- (double*)fPtr: (double*) value {
    if (!value) { return &f; }
    return value;
}
@end

@implementation M
- (id)init {
    if (self = [super init]) {
        self->f = 3.10;
        self->i = 42;
        self->p = &i;
        self->s = [[N alloc] init];
        self->ss = [[K alloc] init];
    }

    return self;
}

- (double*)fPtr: (double*) value {
    if (!value) { return &f; }
    return value;
}
- (int64_t*)iPtr: (int64_t*) value {
    if (!value) { return &i; }
    return value;
}
- (int64_t**)pPtr: (int64_t**) value {
    if (!value) { return &p; }
    return value;
}
- (N*__strong*)sPtr: (N*__strong*) value {
    if (!value) { return &s; }
    return value;
}
- (K*__strong*)ssPtr: (K*__strong*) value {
    if (!value) { return &ss; }
    return value;
}

@end
