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
    bool* ptrbool;
    char* ptrchar;
    int8_t* ptri8;
    uint8_t* ptrui8;
    int16_t* ptri16;
    uint16_t* ptrui16;
    int32_t* ptri32;
    uint32_t* ptrui32;
    int64_t* ptri64;
    uint64_t* ptrui64;
    float* ptrf32;
    double* ptrf64;
} teststruct;

teststruct testfunc1()
{
    teststruct cjstruct;

    cjstruct.ptrbool = (bool*)malloc(sizeof(bool) * 3);
    cjstruct.ptrbool[0] = true;
    cjstruct.ptrbool[1] = false;
    cjstruct.ptrbool[2] = true;

    cjstruct.ptrchar = (char*)malloc(sizeof(char) * 3);
    cjstruct.ptrchar[0] = 'a';
    cjstruct.ptrchar[1] = 'b';
    cjstruct.ptrchar[2] = 'c';

    cjstruct.ptri8 = (int8_t*)malloc(sizeof(int8_t) * 3);
    cjstruct.ptri8[0] = -128;
    cjstruct.ptri8[1] = 123;
    cjstruct.ptri8[2] = 127;

    cjstruct.ptrui8 = (uint8_t*)malloc(sizeof(uint8_t) * 3);
    cjstruct.ptrui8[0] = 0;
    cjstruct.ptrui8[1] = 2;
    cjstruct.ptrui8[2] = 255;

    cjstruct.ptri16 = (int16_t*)malloc(sizeof(int16_t) * 3);
    cjstruct.ptri16[0] = -32768;
    cjstruct.ptri16[1] = 0;
    cjstruct.ptri16[2] = 32767;

    cjstruct.ptrui16 = (uint16_t*)malloc(sizeof(uint16_t) * 3);
    cjstruct.ptrui16[0] = 0;
    cjstruct.ptrui16[1] = 2;
    cjstruct.ptrui16[2] = 65535;

    cjstruct.ptri32 = (int32_t*)malloc(sizeof(int32_t) * 3);
    cjstruct.ptri32[0] = -2147483648;
    cjstruct.ptri32[1] = 0;
    cjstruct.ptri32[2] = 2147483647;

    cjstruct.ptrui32 = (uint32_t*)malloc(sizeof(uint32_t) * 3);
    cjstruct.ptrui32[0] = 0;
    cjstruct.ptrui32[1] = 2;
    cjstruct.ptrui32[2] = 4294967295;

    cjstruct.ptri64 = (int64_t*)malloc(sizeof(int64_t) * 3);
    cjstruct.ptri64[0] = -9223372036854775808;
    cjstruct.ptri64[1] = 0;
    cjstruct.ptri64[2] = 9223372036854775807;

    cjstruct.ptrui64 = (uint64_t*)malloc(sizeof(uint64_t) * 3);
    cjstruct.ptrui64[0] = 0;
    cjstruct.ptrui64[1] = 2;
    cjstruct.ptrui64[2] = 18446744073709551615;

    cjstruct.ptrf32 = (float*)malloc(sizeof(float) * 3);
    cjstruct.ptrf32[0] = 3.14;
    cjstruct.ptrf32[1] = 0;
    cjstruct.ptrf32[2] = -3.14;

    cjstruct.ptrf64 = (double*)malloc(sizeof(double) * 3);
    cjstruct.ptrf64[0] = 3.1415926;
    cjstruct.ptrf64[1] = 0;
    cjstruct.ptrf64[2] = -3.1415926;

    return cjstruct;
}

int8_t testfunc2(teststruct st)
{
    int count = 0;

    if ((st.ptrbool[0] == 0) && (st.ptrbool[1] == 0) && (st.ptrbool[2] == 1)) {
        count += 1;
    } else {
        printf("bool\n");
    }

    if ((st.ptrchar[0] == 'd') && (st.ptrchar[1] == 'b') && (st.ptrchar[2] == 'c')) {
        count += 1;
    } else {
        printf("char\n");
    }

    if ((st.ptri8[0] == -127) && (st.ptri8[1] == 123) && (st.ptri8[2] == 127)) {
        count += 1;
    } else {
        printf("3\n");
    }

    if ((st.ptrui8[0] == 1) && (st.ptrui8[1] == 2) && (st.ptrui8[2] == 255)) {
        count += 1;
    } else {
        printf("4\n");
    }

    if ((st.ptri16[0] == -32767) && (st.ptri16[1] == 0) && (st.ptri16[2] == 32767)) {
        count += 1;
    } else {
        printf("5\n");
    }

    if ((st.ptrui16[0] == 1) && (st.ptrui16[1] == 2) && (st.ptrui16[2] == 65535)) {
        count += 1;
    } else {
        printf("6\n");
    }

    if ((st.ptri32[0] == -2147483647) && (st.ptri32[1] == 0) && (st.ptri32[2] == 2147483647)) {
        count += 1;
    } else {
        printf("7\n");
    }

    if ((st.ptrui32[0] == 1) && (st.ptrui32[1] == 2) && (st.ptrui32[2] == 4294967295)) {
        count += 1;
    } else {
        printf("8\n");
    }

    if ((st.ptri64[0] == -9223372036854775807) && (st.ptri64[1] == 0) && (st.ptri64[2] == 9223372036854775807)) {
        count += 1;
    } else {
        printf("9\n");
    }

    if ((st.ptrui64[0] == 1) && (st.ptrui64[1] == 2) && (st.ptrui64[2] == 18446744073709551615)) {
        count += 1;
    } else {
        printf("10\n");
    }

    if ((st.ptrf32[0] - 3.24 < 1e-6) && (st.ptrf32[1] - 0.000000 < 1e-6) && (st.ptrf32[2] - -3.140000 < 1e-6)) {
        count += 1;
    } else {
        printf("11\n");
    }

    if ((st.ptrf64[0] == 3.2415926) && (st.ptrf64[1] == 0.0) && (st.ptrf64[2] == -3.1415926)) {
        count += 1;
    } else {
        printf("12\n");
    }

    if (count == 12) {
        return 0;
    } else {
        return 1;
    }
}
