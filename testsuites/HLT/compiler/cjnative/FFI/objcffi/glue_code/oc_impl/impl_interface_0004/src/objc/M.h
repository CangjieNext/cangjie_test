/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@protocol I
@property (assign) int64_t p1;
@property (readonly) int64_t p2;
- (void)f1;
@required
- (void)f2;
@optional
- (void)f3;
@end

@interface M : NSObject
- (id)init;
@end
