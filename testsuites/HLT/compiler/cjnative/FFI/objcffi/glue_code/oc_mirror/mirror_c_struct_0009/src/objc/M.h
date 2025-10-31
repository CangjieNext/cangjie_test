/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>
#import "M1.h"

typedef struct {
    int64_t x;
    M1 y;
} S;

@interface M : NSObject
{
    @private
    S s;
}

- (id)init;
- (S)goo;

@end
