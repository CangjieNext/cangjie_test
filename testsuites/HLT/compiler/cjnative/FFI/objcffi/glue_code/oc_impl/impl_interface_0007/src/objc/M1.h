/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@protocol I
@property (readwrite) int64_t p1;
@property (readwrite) int64_t p2;
- (void)f1;
@required
- (void)f2;
@optional
- (void)f3;
@end

@interface M1 : NSObject <I>

- (id)init:(int64_t)a;
- (void)f1;
- (void)f3;
@property (readwrite) int64_t p1;

@end
