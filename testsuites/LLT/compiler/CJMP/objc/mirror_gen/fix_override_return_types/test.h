/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// 1) In Cangjie, Option is not covariant.  If the overridden and overrider have
// different nullabilities, fix the result type of the overrider.
//
// 2) In Cangjie, Option is not covariant.  If both the overridden and overrider
// are nullable, ensure that the overrider does not change the result type.
//
// 3) In Objective-C, contravariant return types are allowed.  That will not
// compile in Cangjie. Fix the result type of the overrider accordingly.

@interface Base
// 1
-(nullable Base*)f0;
-(nonnull Base*)f1;

// 2
-(nullable Base*)f2;
-(nonnull Base*)f3;

// 3
-(nullable Base*)f4;
-(nonnull Base*)f5;
@end

@interface M : Base
// 1
-(nonnull Base*)f0;
-(nullable Base*)f1;

// 2
-(nullable M*)f2;
-(nonnull M*)f3;

// 3
-(nullable id)f4;
-(nonnull id)f5;
@end
