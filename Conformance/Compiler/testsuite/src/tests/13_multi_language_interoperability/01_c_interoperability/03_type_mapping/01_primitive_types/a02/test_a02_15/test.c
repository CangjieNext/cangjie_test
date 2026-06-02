/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <sys/types.h>

static ssize_t value;

void func_01(ssize_t x) {
    value = x;
}

ssize_t func_02() {
    return value;
}