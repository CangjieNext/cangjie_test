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

struct teststruct {
    uint8_t ui8;
    int16_t i16;
    uint16_t ui16;
    uint16_t* pui16;
};

struct teststruct testfunc1()
{
    struct teststruct cjstruct;
    cjstruct.ui8 = 123;
    cjstruct.i16 = 456;
    cjstruct.ui16 = 789;
    cjstruct.pui16 = (uint16_t*)malloc(sizeof(uint16_t) * 3);
    memset(cjstruct.pui16, 0, 3);
    cjstruct.pui16[0] = 4;
    cjstruct.pui16[1] = 5;
    cjstruct.pui16[2] = 6;
    return cjstruct;
}

struct teststruct testfunc2(struct teststruct st)
{
    if ((st.ui8 == 255) && (st.i16 == 111) && (st.ui16 == 222) && (st.pui16[0] = 7) && (st.pui16[1] = 8) &&
        (st.pui16[2] = 9)) {
        st.ui8 -= 1;
        st.i16 += 1;
        st.ui16 += 1;
        st.pui16[0] += 1;
        st.pui16[1] += 1;
        st.pui16[2] += 1;
        printf("pass1\n");
    }

    return st;
}
