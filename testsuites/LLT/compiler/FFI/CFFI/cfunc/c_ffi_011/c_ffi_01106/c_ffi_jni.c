// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern int32_t testfunc(int32_t (*a)(int32_t, int32_t)) {
    int32_t res = a(1, 2);
    return res;
}
