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

static int8_t value = -77;

static int8_t *ptr = &value;

int8_t **func_01() {
    return &ptr;
}

_Bool func_02(int8_t *ptr1) {
    return ptr1 == &value;
}