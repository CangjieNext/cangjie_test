/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface test<T> : NSObject
- (T)f1;
+ (T)f2;
- (T)f3:(int)a;
+ (T)f4:(int)a;
- (T)f5:(int)a and:(NSString*)s;
+ (T)f6:(int)a and:(NSString*)s;
@end
