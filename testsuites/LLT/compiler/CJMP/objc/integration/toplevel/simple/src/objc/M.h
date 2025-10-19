/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>
#import <stddef.h>

@interface M : NSObject

- (id)init;

@end

NSString* foo(NSString* arg, double arg2);

NSString* className(NSObject* arg);

int64_t bar(int64_t arg);

int64_t bar2(int64_t arg);
