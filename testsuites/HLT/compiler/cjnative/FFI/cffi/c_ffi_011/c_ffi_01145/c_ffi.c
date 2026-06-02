/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

void get_cptr(void(*ptr)(int8_t*) ){
    int8_t* ptrtmp = (int8_t*)malloc(sizeof(int8_t)*3);
    ptrtmp[0] = 48;
    ptrtmp[1] = 48;
    ptrtmp[2] = 48;
    ptr(ptrtmp);
}
