// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern int64_t testfunc(int64_t (*a)(int64_t, int64_t)) {
    int64_t res = a(-9223372036854760000, -10000);
    return res;
}
