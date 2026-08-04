/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>

int32_t testfunc(int16_t param1, int16_t param2, int16_t param3, int16_t param4) {
    int32_t res = param1 + param2 - param3 - param4;
    return res;
}