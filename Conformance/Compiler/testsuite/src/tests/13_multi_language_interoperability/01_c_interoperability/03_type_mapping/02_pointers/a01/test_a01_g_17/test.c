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

static uint8_t value = 128;

static uint8_t *ptr = &value;

uint8_t **func_01() {
    return &ptr;
}

_Bool func_02(uint8_t *ptr1) {
    return ptr1 == &value;
}