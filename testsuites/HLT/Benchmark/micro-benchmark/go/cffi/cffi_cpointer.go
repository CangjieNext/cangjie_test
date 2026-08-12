/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

/*
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

//------------------------------------------------------------------
// BenchmarkCffiCpointer1
//------------------------------------------------------------------
int64_t *cpointer_getptr1(int64_t num)
{
    int64_t *ptr = (int64_t *)malloc(sizeof(int64_t));
    ptr[0] = num;
    return ptr;
}

int32_t cpointer_testfunc1(int64_t *param1, int64_t *param2, int64_t *param3, int64_t *param4)
{
    int32_t res = *param1 + *param2 + *param3 - *param4;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiCpointer2
//------------------------------------------------------------------
struct Data15
{
    int8_t a0;
    int16_t a1;
    int32_t a2;
    int64_t a3;
};

struct Data15 *cpointer_getptr2(int8_t num1, int16_t num2, int32_t num3, int64_t num4)
{
    struct Data15 *ptr = (struct Data15 *)malloc(sizeof(struct Data15));
    ptr->a0 = num1;
    ptr->a1 = num2;
    ptr->a2 = num3;
    ptr->a3 = num4;
    return ptr;
}

int32_t cpointer_testfunc2(struct Data15 *param1, struct Data15 *param2, struct Data15 *param3, struct Data15 *param4)
{
    int32_t res = param1->a0 + param2->a1 + param3->a2 - param4->a3;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiCpointer3
//------------------------------------------------------------------
int8_t *cpointer_getptr3(int8_t num)
{
    int8_t *ptr = (int8_t *)malloc(sizeof(int8_t));
    ptr[0] = num;
    return ptr;
}

int32_t cpointer_testfunc3(int8_t *param1, int8_t *param2, int8_t *param3, int8_t *param4)
{
    int32_t res = *param1 + *param2 + *param3 - *param4;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiCpointer4
//------------------------------------------------------------------
typedef void *(*cbfunc_ty)();

void *func4()
{
    return 0;
};

cbfunc_ty cpointer_getptr4()
{
    void *(*ret)(void *) = &func4;
    return ret;
}

int32_t cpointer_testfunc4(cbfunc_ty func1, cbfunc_ty func2, cbfunc_ty func3, cbfunc_ty func4)
{
    func1();
    func2();
    func3();
    func4();
    return 0;
};

//------------------------------------------------------------------
// BenchmarkCffiCpointer5
//------------------------------------------------------------------
int64_t *cpointer_getptr5(int64_t num)
{
    int64_t *ptr = (int64_t *)malloc(sizeof(int64_t));
    ptr[0] = num;
    return ptr;
}

int32_t cpointer_testfunc5(int64_t *param1)
{
    int32_t res = *param1 * 2;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiCpointer6
//------------------------------------------------------------------
int64_t *cpointer_getptr6(int64_t num)
{
    int64_t *ptr = (int64_t *)malloc(sizeof(int64_t));
    ptr[0] = num;
    return ptr;
}

int32_t cpointer_testfunc6(int64_t *param1, int64_t *param2, int64_t *param3, int64_t *param4,
                  int64_t *param5, int64_t *param6, int64_t *param7, int64_t *param8)
{
    int32_t res = *param1 + *param2 + *param3 - *param4 + *param5 + *param6 + *param7 - *param8;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiCpointer7
//------------------------------------------------------------------
int64_t *cpointer_getptr7(int64_t num)
{
    int64_t *ptr = (int64_t *)malloc(sizeof(int64_t));
    ptr[0] = num;
    return ptr;
}

int32_t cpointer_testfunc7(int64_t *param1, int64_t *param2, int64_t *param3, int64_t *param4,
                  int64_t *param5, int64_t *param6, int64_t *param7, int64_t *param8,
                  int64_t *param9, int64_t *param10, int64_t *param11, int64_t *param12,
                  int64_t *param13, int64_t *param14, int64_t *param15, int64_t *param16)
{
    int32_t res = *param1 + *param2 + *param3 - *param4 + *param5 + *param6 + *param7 - *param8 -
                  *param9 + *param10 + *param11 - *param12 + *param13 + *param14 + *param15 - *param16;
    return res;
}
*/
import "C"

var p11 = (*C.int64_t)(C.cpointer_getptr1(1))
var p12 = (*C.int64_t)(C.cpointer_getptr1(2))
var p13 = (*C.int64_t)(C.cpointer_getptr1(3))
var p14 = (*C.int64_t)(C.cpointer_getptr1(4))

func RunCPointer1() {
	C.cpointer_testfunc1(p11, p12, p13, p14)
}

var p21 = (*C.struct_Data15)(C.cpointer_getptr2(1, 2, 3, 4))
var p22 = (*C.struct_Data15)(C.cpointer_getptr2(1, 2, 3, 4))
var p23 = (*C.struct_Data15)(C.cpointer_getptr2(1, 2, 3, 4))
var p24 = (*C.struct_Data15)(C.cpointer_getptr2(1, 2, 3, 4))

func RunCPointer2() {
	C.cpointer_testfunc2(p21, p22, p23, p24)
}

var p31 = (*C.int8_t)(C.cpointer_getptr3(1))
var p32 = (*C.int8_t)(C.cpointer_getptr3(2))
var p33 = (*C.int8_t)(C.cpointer_getptr3(3))
var p34 = (*C.int8_t)(C.cpointer_getptr3(4))

func RunCPointer3() {
	C.cpointer_testfunc3(p31, p32, p33, p34)
}

var p41 = (C.cbfunc_ty)(C.cpointer_getptr4())
var p42 = (C.cbfunc_ty)(C.cpointer_getptr4())
var p43 = (C.cbfunc_ty)(C.cpointer_getptr4())
var p44 = (C.cbfunc_ty)(C.cpointer_getptr4())

func RunCPointer4() {
	C.cpointer_testfunc4(p41, p42, p43, p44)
}

var p51 = (*C.int64_t)(C.cpointer_getptr5(1))

func RunCPointer5() {
	C.cpointer_testfunc5(p51)
}

var p61 = (*C.int64_t)(C.cpointer_getptr6(1))
var p62 = (*C.int64_t)(C.cpointer_getptr6(2))
var p63 = (*C.int64_t)(C.cpointer_getptr6(3))
var p64 = (*C.int64_t)(C.cpointer_getptr6(4))
var p65 = (*C.int64_t)(C.cpointer_getptr6(5))
var p66 = (*C.int64_t)(C.cpointer_getptr6(6))
var p67 = (*C.int64_t)(C.cpointer_getptr6(7))
var p68 = (*C.int64_t)(C.cpointer_getptr6(8))

func RunCPointer6() {
	C.cpointer_testfunc6(p61, p62, p63, p64, p65, p66, p67, p68)
}

var p71 = (*C.int64_t)(C.cpointer_getptr7(1))
var p72 = (*C.int64_t)(C.cpointer_getptr7(2))
var p73 = (*C.int64_t)(C.cpointer_getptr7(3))
var p74 = (*C.int64_t)(C.cpointer_getptr7(4))
var p75 = (*C.int64_t)(C.cpointer_getptr7(5))
var p76 = (*C.int64_t)(C.cpointer_getptr7(6))
var p77 = (*C.int64_t)(C.cpointer_getptr7(7))
var p78 = (*C.int64_t)(C.cpointer_getptr7(8))
var p79 = (*C.int64_t)(C.cpointer_getptr7(9))
var p710 = (*C.int64_t)(C.cpointer_getptr7(10))
var p711 = (*C.int64_t)(C.cpointer_getptr7(11))
var p712 = (*C.int64_t)(C.cpointer_getptr7(12))
var p713 = (*C.int64_t)(C.cpointer_getptr7(13))
var p714 = (*C.int64_t)(C.cpointer_getptr7(14))
var p715 = (*C.int64_t)(C.cpointer_getptr7(15))
var p716 = (*C.int64_t)(C.cpointer_getptr7(16))

func RunCPointer7() {
	C.cpointer_testfunc7(p71, p72, p73, p74, p75, p76, p77, p78,
		p79, p710, p711, p712, p713, p714, p715, p716)
}
