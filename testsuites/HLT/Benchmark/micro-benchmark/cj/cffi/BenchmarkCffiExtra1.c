/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct substruct {
    int8_t b0[16];
    uint32_t b1;
    uint32_t b2;
    int8_t b3[6];
    uint8_t b4;
    uint8_t b5;
    int16_t b6;
    uint16_t b7;
    uint8_t b8;
    uint8_t b9;
} strucB;

typedef struct struct1 {
    int8_t a0[6];
    int8_t a1[6];
    uint8_t a2;
    uint8_t a3;
    uint8_t a4;
    uint8_t a5;
    uint32_t a6;
    strucB a7;
} StructA;

uint32_t testfunc(StructA param){
    uint32_t res =  param.a0[3] + param.a1[5] + param.a6 +
                    param.a7.b0[11] + param.a7.b3[2] + param.a7.b5;
    return res;
}