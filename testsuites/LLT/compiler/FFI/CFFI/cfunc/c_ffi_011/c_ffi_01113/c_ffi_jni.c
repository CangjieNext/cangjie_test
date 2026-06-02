// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern int8_t testfunc(int8_t (*a)(int8_t, int8_t)) {
    int8_t res = a(-127, -1);
    return res;
}
