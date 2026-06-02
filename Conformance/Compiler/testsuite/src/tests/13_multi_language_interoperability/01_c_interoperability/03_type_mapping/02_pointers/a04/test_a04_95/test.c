/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stdint.h>
#include <stddef.h>

static uint64_t value = 18000000000000000000ULL;

uint32_t *func_01() {
    return &value;
}

_Bool func_02(uint32_t *ptr) {
    return ptr == &value;
}