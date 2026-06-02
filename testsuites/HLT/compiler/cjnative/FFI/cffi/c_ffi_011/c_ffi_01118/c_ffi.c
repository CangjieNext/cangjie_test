/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

extern uint32_t testfunc(uint32_t (*a)(uint32_t, uint32_t))
{
    uint32_t res = a(4294967294, 1);
    return res;
}
