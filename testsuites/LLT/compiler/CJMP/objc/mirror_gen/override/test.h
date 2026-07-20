/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@interface A
+ (void)f1;
- (void)f1;
@property int f2;
- (void)f3;
- (A*)f4:(double)x;
+ (A*)f5:(double)x;
@property int f6;
@property int f7;
@property (class) int f7;
- (int)f8;
@property int f9;
- (void)setF10:(int)x;
@property (getter=get_f11)int f11;
@property (readonly, getter=get_f12)int f12;
@end

@interface M : A
+ (void)f1;
- (void)f2;
@property int f3;
- (double)f4:(A*)x;
+ (double)f5:(A*)x;
@property int f6;
- (void)f7;
+ (void)f7;
@property int f8;
- (int)f8;
- (void)setF9:(int)x;
@property int f10;
- (int)f11;
- (int)get_f11;
- (int)f12;
- (int)get_f12;
@end
