/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

/*
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

//------------------------------------------------------------------
// BenchmarkCffiExtra1
//------------------------------------------------------------------
typedef struct substruct
{
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

typedef struct struct1
{
    int8_t a0[6];
    int8_t a1[6];
    uint8_t a2;
    uint8_t a3;
    uint8_t a4;
    uint8_t a5;
    uint32_t a6;
    strucB a7;
} StructA;

uint32_t extra_testfunc1(StructA param)
{
    uint32_t res = param.a0[3] + param.a1[5] + param.a6 +
                   param.a7.b0[11] + param.a7.b3[2] + param.a7.b5;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiExtra2
//------------------------------------------------------------------
typedef struct data_13
{
    uint32_t a0;
    uint32_t a1;
    uint32_t a2;
    uint8_t a3;
} StructData;

StructData *extra_getptr2(int8_t num1, int16_t num2, int32_t num3, int64_t num4)
{
    StructData *ptr = (StructData *)malloc(sizeof(StructData));
    ptr->a0 = num1;
    ptr->a1 = num2;
    ptr->a2 = num3;
    ptr->a3 = num4;
    return ptr;
}

int32_t extra_testfunc2(StructData *Data, uint32_t Size)
{
    int32_t res = Data->a0 + Data->a1 + Data->a2 + Data->a3 + Size;
    return res;
};
*/
import "C"

var st1 = C.StructA{
	a0: [6]C.int8_t{1, 1, 1, 1, 1},
	a1: [6]C.int8_t{2, 2, 2, 2, 2},
	a2: 3,
	a3: 4,
	a4: 5,
	a5: 6,
	a6: 7,
	a7: C.strucB{
		b0: [16]C.int8_t{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		b1: 2,
		b2: 3,
		b3: [6]C.int8_t{4, 4, 4, 4, 4, 4},
		b4: 5,
		b5: 6,
		b6: 7,
		b7: 8,
		b8: 9,
		b9: 10,
	},
}

func RunExtra1() {
	C.extra_testfunc1(st1)
}

var st2 = (*C.StructData)(C.extra_getptr2(1, 2, 3, 4))

func RunExtra2() {
	C.extra_testfunc2(st2, 1)
}
