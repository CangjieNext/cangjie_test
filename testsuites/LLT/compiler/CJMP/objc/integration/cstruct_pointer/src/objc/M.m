#import <objc/runtime.h>
#import "M.h"

@implementation M

- (id)init {
    if (self = [super init]) {
        printf("objc: M init()\n");
    }

    return self;
}

- (struct Point2D*) printPointOC:(struct Point2D*)point {
    printf("objc: point %f %f\n", point->x, point->y);
    return point;
}

@end
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

