/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stdint.h>

int64_t func_01(uint8_t* buf, int64_t size) {
    int64_t ret = 0;
    for (int64_t i = 0; i < size; ++i) {ret += buf[i];}
    return ret;
}

double func_02(int64_t* a, double* b, int64_t size) {
    double ret = .0;
    for (int64_t i = 0; i < size; ++i) {ret += a[i] * b[i];}
    return ret;
}
