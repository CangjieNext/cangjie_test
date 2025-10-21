/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint-gcc.h>

// Pass an array
void cfooc1(int8_t a)
{
}

void cfooc2(int32_t a[1][3])
{
    a[0][0] = 0;
}
