/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int64_t* getptr(int64_t num) {
    int64_t* ptr = (int64_t*)malloc(sizeof(int64_t));
    ptr[0] = num;
    return ptr;
}

int32_t testfunc(int64_t* param1, int64_t* param2, int64_t* param3, int64_t* param4,
                 int64_t* param5, int64_t* param6, int64_t* param7, int64_t* param8,
                 int64_t* param9, int64_t* param10, int64_t* param11, int64_t* param12,
                 int64_t* param13, int64_t* param14, int64_t* param15, int64_t* param16) {
    int32_t res = *param1 + *param2 + *param3 - *param4 + *param5 + *param6 + *param7 - *param8 -
                  *param9 + *param10 + *param11 - *param12 + *param13 + *param14 + *param15 - *param16;
    return res;
}