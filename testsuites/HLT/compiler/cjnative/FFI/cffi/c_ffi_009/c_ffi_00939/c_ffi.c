/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    uint8_t ui8;
    char* str;
} teststruct;

teststruct testfunc1()
{
    teststruct cjstruct;
    cjstruct.ui8 = 123;
    cjstruct.str = (char*)malloc(sizeof(char) * 4);
    memset(cjstruct.str, 0, 4);
    cjstruct.str[0] = 'a';
    cjstruct.str[1] = 'b';
    cjstruct.str[2] = 'c';
    return cjstruct;
}

teststruct testfunc2(teststruct st)
{
    if ((st.ui8 == 255) && (strcmp("efg", st.str) == 0)) {
        st.ui8 = 124;
        st.str[0] = 104;
        st.str[1] = 105;
        st.str[2] = 106;
    }

    return st;
}
