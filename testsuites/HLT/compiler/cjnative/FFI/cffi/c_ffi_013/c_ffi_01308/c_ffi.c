/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>

int32_t nativeFun(int32_t (*callback)(int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t, int32_t),
                  int32_t r0, int32_t r1, int32_t r2, int32_t r3, int32_t r4, int32_t r5, int32_t r6, int32_t r7)
{
    return callback(r0, r1, r2, r3, r4, r5, r6, r7);
}
