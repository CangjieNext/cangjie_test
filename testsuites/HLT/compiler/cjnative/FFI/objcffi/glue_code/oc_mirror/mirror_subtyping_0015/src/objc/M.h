/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface M : NSObject

- (id)init;
- (void)f1:(int64_t)a0;
+ (void)f2:(int64_t)a0;
@property int64_t p1;
@property (class) int64_t p2;

@end
