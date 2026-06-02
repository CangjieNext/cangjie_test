/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@class A;
@class B;
@class C;
@class M;

@interface A
-(C*)c;
@end

@interface B
-(A*)a;
@end

@interface C
-(B*)b;
@end

@interface M
-(C*)c;
@end
