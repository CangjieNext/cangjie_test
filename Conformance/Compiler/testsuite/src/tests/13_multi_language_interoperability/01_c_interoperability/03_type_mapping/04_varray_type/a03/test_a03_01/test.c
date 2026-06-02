/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <math.h>
#include <stdint.h>

typedef int64_t (*callback_t)(int8_t buf[1024]);

int64_t func_02(const void *cb, int8_t x[1024]) {
    callback_t callback = (callback_t)cb;
    return callback(x);
}
