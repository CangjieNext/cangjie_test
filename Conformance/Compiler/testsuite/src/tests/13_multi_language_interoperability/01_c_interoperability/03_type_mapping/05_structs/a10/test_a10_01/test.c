/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <string.h>
#include <stdint.h>

struct S {
    int32_t a[2];
    int32_t b[0];
    int32_t c[0];
};

struct S dup(struct S x) {
    struct S ret = {.a = {0, 0}};
    memcpy_s(&ret, sizeof ret, &x, sizeof ret);
    return ret;
}

struct S sum(struct S *x, size_t n) {
    struct S ret = {.a = {0, 0}};
    for(size_t i = 0; i < n; ++i) {
        ret.a[0] += x[i].a[0];
        ret.a[1] += x[i].a[1];
    }
    return ret;
}
