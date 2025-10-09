/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface test<T> : NSObject
- (void)f1:(T)t;
+ (void)f2:(T)t;
- (int)f3:(NSString*)s and:(T)t;
+ (int)f4:(NSString*)s and:(T)t;
- (NSString*)f5:(T)t and:(NSString*)s;
+ (NSString*)f6:(T)t and:(NSString*)s;
- (T)f7:(T)t;
+ (T)f8:(T)t;
@end
