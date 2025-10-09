/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface test : NSObject
- (signed char)f1;
- (short)f2;
- (int)f3;
- (long)f4;
- (NSInteger)f5;
- (unsigned char)f6;
- (unsigned short)f7;
- (unsigned int)f8;
- (unsigned long)f9;
- (NSUInteger)f10;
- (float)f11;
- (double)f12;
+ (void)g1:(signed char)a;
+ (void)g2:(short)a;
+ (void)g3:(int)a;
+ (void)g4:(long)a;
+ (void)g5:(NSInteger)a;
+ (void)g6:(unsigned char)a;
+ (void)g7:(unsigned short)a;
+ (void)g8:(unsigned int)a;
+ (void)g9:(unsigned long)a;
+ (void)g10:(NSUInteger)a;
+ (void)g11:(float)a;
+ (void)g12:(double)a;
@end
