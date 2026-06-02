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

static double value = 1.41421356237;

static double *ptr = &value;

double **func_01() {
    return &ptr;
}

_Bool func_02(double *ptr1) {
    return ptr1 == &value;
}