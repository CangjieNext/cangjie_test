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

static int32_t value = 0;

int32_t *func_01() {
    return (int32_t *)&value;
}

_Bool func_02(int32_t *ptr) {
    return ptr == &value;
}