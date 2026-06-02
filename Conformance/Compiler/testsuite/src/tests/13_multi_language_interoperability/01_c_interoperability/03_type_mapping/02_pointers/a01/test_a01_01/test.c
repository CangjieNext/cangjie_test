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

struct ABC {
    int32_t f1;
    float f2;
};

static struct ABC value = { 123456, 1.41421356237f };

struct ABC *func_01() {
    return &value;
}
