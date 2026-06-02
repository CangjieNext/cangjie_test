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

struct teststruct {
    bool b;
    char c;
    int8_t i8;
    uint8_t ui8;
    int16_t i16;
    uint16_t ui16;
};

int8_t testfunc(struct teststruct st)
{
    if ((st.b == true) && (st.c == 'a') && (st.i8 == 127) && (st.ui8 == 255) && (st.i16 == 32767) &&
        (st.ui16 == 65535)) {
        printf("pass\n");
    }

    return 0;
}
