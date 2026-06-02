/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stddef.h>
#include <stdint.h>
#include <sys/types.h>
#include <limits.h>

static size_t value1;
static ssize_t value2;


size_t get_size_t_max() {
    return SIZE_MAX;
}

ssize_t get_ssize_t_max() {
    return SSIZE_MAX;
}

void set_01(size_t x) {
    value1 = x;
}

size_t get_01() {
    return value1;
}

void set_02(ssize_t x) {
    value2 = x;
}

ssize_t get_02() {
    return value2;
}
