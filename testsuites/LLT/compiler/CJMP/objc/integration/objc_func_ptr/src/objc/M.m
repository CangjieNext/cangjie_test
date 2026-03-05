// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"

int64_t global = 32;

int64_t* a() {
    return &global;
}

@implementation M
- (id)init {
    if (self = [super init]) {
        fptr = &a;
    }
    return self;
}
@end
