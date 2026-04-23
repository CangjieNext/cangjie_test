/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@class M;

typedef M* (^B)(M* x);
typedef M* _Nullable (^ _Nullable B0)(M* _Nullable x);
typedef M* _Nonnull (^ _Nonnull B1)(M* _Nonnull x);

@interface M {
    B b;
    B0 b0;
    B1 b1;
    B _Nullable b_0;
    B _Nonnull b_1;
}
-(void)f0: (M* _Nullable (^)(M* _Nullable x))b;
-(void)f1: (M* _Nonnull (^)(M* _Nonnull x))b;
@end
