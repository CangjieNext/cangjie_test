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
    int32_t i32;
    uint32_t ui32b;
    int64_t i64;
    uint64_t ui64;
    float f32;
    double f64;
};

int8_t testfunc(struct teststruct st)
{
    if ((st.b == true) && (st.c == 'a') && (st.i8 == 111) && (st.ui8 == 111) && (st.i16 == 11111) &&
        (st.ui16 == 11111) && (st.i32 == 1111111111) && (st.ui32b == 1111111111) && (st.i64 == 11111111111111) &&
        (st.ui64 == 111111111111111) && (st.f32 - 111.1 < 1e-6) && (st.f64 - 111111.1 < 1e-16)) {
        return 0;
    } else {
        return 1;
    }
}
