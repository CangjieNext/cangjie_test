/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@class M;

typedef M* (*F)(M* x);
typedef M* _Nullable (* _Nullable F0)(M* _Nullable x);
typedef M* _Nonnull (* _Nonnull F1)(M* _Nonnull x);

@interface M {
    F p;
    F0 p0;
    F1 p1;
    F _Nullable p_0;
    F _Nonnull p_1;
}
-(void)f0: (M* _Nullable (*)(M* _Nullable x))p;
-(void)f1: (M* _Nonnull (*)(M* _Nonnull x))p;
@end
