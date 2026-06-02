/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdlib.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

typedef struct {
    int8_t i8;
    uint8_t ui8;
    char* ptr;
} teststruct;

teststruct testfunc1()
{
    teststruct cjstruct;
    cjstruct.i8 = 123;
    cjstruct.ui8 = 123;
    cjstruct.ptr = (char*)malloc(sizeof(char) * 4);
    memset(cjstruct.ptr, 0, 4);
    cjstruct.ptr[0] = 'a';
    cjstruct.ptr[1] = 'b';
    cjstruct.ptr[2] = 'c';
    return cjstruct;
}

int8_t testfunc2(teststruct st)
{
    if ((st.i8 == -128) && (st.ui8 == 255) && (st.ptr[0] == 'e') && (st.ptr[1] == 'f') && (st.ptr[2] == 'g')) {
        return 0;
    } else {
        return 1;
    }
}
