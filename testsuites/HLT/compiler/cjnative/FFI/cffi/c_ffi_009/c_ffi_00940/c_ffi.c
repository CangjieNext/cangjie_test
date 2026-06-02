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
    uint8_t* pui8;
} teststruct;

teststruct testfunc1()
{
    teststruct cjstruct;
    cjstruct.ui8 = 123;
    cjstruct.pui8 = (char*)malloc(sizeof(uint8_t) * 4);
    memset(cjstruct.pui8, 0, 4);
    cjstruct.pui8[0] = 4;
    cjstruct.pui8[1] = 5;
    cjstruct.pui8[2] = 6;
    return cjstruct;
}

teststruct testfunc2(teststruct st)
{
    if ((st.ui8 == 255) && (st.pui8[0] = 4) && (st.pui8[1] = 5) && (st.pui8[2] = 6)) {
        st.ui8 = 124;
        st.pui8[0] += 1;
        st.pui8[1] += 1;
        st.pui8[2] += 1;
    }

    return st;
}
