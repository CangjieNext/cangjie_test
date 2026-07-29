/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

typedef int T1;
typedef int T2;
typedef int T3;
typedef int T4;
typedef int T5;
typedef int T6;
typedef int T7;
typedef int T8;
typedef int T9;
typedef int T10;
typedef int T11;

struct S {
    T1 T1;
    T2* T2;
};

@interface M {
    struct S S;
    T1* T1;
}
- (T2)T2;
- (T3*)T3;
- (void)foo:(T3)T3;
- (void)T4:(T4)x;
- (void)T5:(T5*)x;
@property T6 T6;
@property T7* T7;

+ (T8)T8;
- (T9)T9;
+ (T9)T9;

@property (class) T10 T10;
@property T11 T11;
@property (class) T11 T11;
@end
