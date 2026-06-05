/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@class M;

typedef M* M_;
typedef M* _Nullable M0;
typedef M* _Nonnull M1;
typedef M_ _Nullable M_0;
typedef M_ _Nonnull M_1;

@interface M
// Objective-C does not support method overloading in the Cangjie sense.  These
// five methods will be considered by clang as one method.  At the Cangjie side,
// just one method must be created as well.
-(instancetype)init: (M_)x;
-(instancetype)init: (M0)x;
-(instancetype)init: (M1)x;
-(instancetype)init: (M_0)x;
-(instancetype)init: (M_1)x;

// And these must be converted to five different methods.
-(instancetype)init1: (M_)x;
-(instancetype)init2: (M0)x;
-(instancetype)init3: (M1)x;
-(instancetype)init4: (M_0)x;
-(instancetype)init5: (M_1)x;
@end
