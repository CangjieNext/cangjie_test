/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stddef.h>
#include <stdint.h>

struct S1 {
    int32_t f1;
};

struct S2 {
    struct S1 fld;
};

struct S2 st = { { 12345 } };

struct S2 func_01() {
    return st;
}
