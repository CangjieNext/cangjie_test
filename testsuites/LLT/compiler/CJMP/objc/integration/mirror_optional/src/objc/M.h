/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@protocol I
@optional
- (void) memberFuncNotImplemented:(int) n;
- (void) memberFuncImplemented:(int) n;
@optional
+ (void) staticFuncNotImplemented;
+ (void) staticFuncImplemented;
@end

@interface M : NSObject <I>
- (id)init;
- (void) memberFuncImplemented:(int) n;
+ (void) staticFuncImplemented;
@end
