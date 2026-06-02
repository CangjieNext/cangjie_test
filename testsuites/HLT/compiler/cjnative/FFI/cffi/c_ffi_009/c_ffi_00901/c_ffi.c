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
    if ((st.b == true) && (st.c == 'a') && (st.i8 == 127) && (st.ui8 == 255) && (st.i16 == 32767) &&
        (st.ui16 == 65535) && (st.i32 == 2147483647) && (st.ui32b == 4294967295) && (st.i64 == 9223372036854770000) &&
        (st.ui64 == 18446744073709500000) && (st.f32 - 34028235612225536.000000 < 1e-6) &&
        (st.f64 - 175439769543232323584.000000 < 1e-16)) {
        return 0;
    } else {
        return 1;
    }
}
