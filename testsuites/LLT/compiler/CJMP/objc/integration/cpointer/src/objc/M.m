// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
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

- (id)initWithPtr:(void*)ptr {
    if (self = [super init]) {
        printf("objc: [M initWithPtr]\n");
    }

    return self;
}

- (void*) getPointer {
    int* ptr = malloc(sizeof(int32_t));
    *ptr = 42;
    return ptr;
}

@end
