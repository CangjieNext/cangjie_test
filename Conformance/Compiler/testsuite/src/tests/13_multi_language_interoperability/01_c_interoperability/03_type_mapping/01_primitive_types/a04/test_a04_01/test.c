/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stdint.h>

int32_t value = -222;

int *initialize() {
    return &value;
}

float func_01(int32_t x, int32_t *y, double z) {
    float result = sqrt(z);
    result += x;
    result += *y;
    return result;
}
