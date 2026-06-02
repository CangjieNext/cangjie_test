/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern uint64_t testfunc(uint64_t (*a)(uint64_t, uint64_t)) {
    uint64_t res = a(18446744073709400000, 100000);
    return res;
}
