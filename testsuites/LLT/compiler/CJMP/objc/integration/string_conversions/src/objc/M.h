/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface M : NSObject
- (id)init;
+ (NSString*)helloAscii;
+ (NSString*)otherHelloAscii;
+ (NSString*)helloCyrillic;
+ (NSString*)helloCangjie;
+ (NSString*)empty;
+ (NSString*)uppercase:(NSString*)str;
+ (void)checkUpperHelloAscii:(NSString*)str;
+ (void)checkExportedImpl;
@end
