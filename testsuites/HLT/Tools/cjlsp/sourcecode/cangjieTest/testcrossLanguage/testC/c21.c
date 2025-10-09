/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint-gcc.h>

extern int32_t testCFun(int32_t (*a)(int32_t, int32_t))
{
    int32_t res = a(-2147483647, -1);
    return res;
}
