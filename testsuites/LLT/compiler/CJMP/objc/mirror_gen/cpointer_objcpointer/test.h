/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct CType {
    struct CType* a;
    int b;
};

@class M;

struct ObjCCompat {
    M* const* a;
    int b;
};

@interface M {
    int *a;
    M* const* b;
    struct CType* c;
    struct ObjCCompat* d;
}
@end
