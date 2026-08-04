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

//------------------------------------------------------------------
// BenchmarkCffiPrimitive1
//------------------------------------------------------------------
int32_t primitive_testfunc1(int64_t param1, int64_t param2, int64_t param3, int64_t param4)
{
    int64_t res = param1 + param2 - param3 - param4;
    return (int32_t)res;
}

//------------------------------------------------------------------
// BenchmarkCffiPrimitive2
//------------------------------------------------------------------
int32_t primitive_testfunc2(int64_t param1)
{
    int32_t res = param1 % 2;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiPrimitive3
//------------------------------------------------------------------
int32_t primitive_testfunc3(int64_t param1, int64_t param2, int64_t param3, int64_t param4,
                            int64_t param5, int64_t param6, int64_t param7, int64_t param8)
{
    int32_t res = param1 + param2 + param3 + param4 - param5 - param6 - param7 - param8;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiPrimitive4
//------------------------------------------------------------------
int32_t primitive_testfunc4(int64_t param1, int64_t param2, int64_t param3, int64_t param4,
                            int64_t param5, int64_t param6, int64_t param7, int64_t param8,
                            int64_t param9, int64_t param10, int64_t param11, int64_t param12,
                            int64_t param13, int64_t param14, int64_t param15, int64_t param16)
{
    int32_t res = param1 + param2 + param3 + param4 - param5 - param6 - param7 - param8 +
                  param9 + param10 + param11 + param12 - param13 - param14 - param15 - param16;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiPrimitive5
//------------------------------------------------------------------
int32_t primitive_testfunc5(int8_t param1, int8_t param2, int8_t param3, int8_t param4)
{
    int32_t res = param1 + param2 - param3 - param4;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiPrimitive6
//------------------------------------------------------------------
int32_t primitive_testfunc6(int16_t param1, int16_t param2, int16_t param3, int16_t param4)
{
    int32_t res = param1 + param2 - param3 - param4;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiPrimitive7
//------------------------------------------------------------------
int32_t primitive_testfunc7(int32_t param1, int32_t param2, int32_t param3, int32_t param4)
{
    int32_t res = param1 + param2 - param3 - param4;
    return res;
}
*/
import "C"

var param1 = C.int64_t(1)
var param2 = C.int64_t(2)
var param3 = C.int64_t(3)
var param4 = C.int64_t(4)
var param5 = C.int64_t(5)
var param6 = C.int64_t(6)
var param7 = C.int64_t(7)
var param8 = C.int64_t(8)
var param9 = C.int64_t(9)
var param10 = C.int64_t(10)
var param11 = C.int64_t(11)
var param12 = C.int64_t(12)
var param13 = C.int64_t(13)
var param14 = C.int64_t(14)
var param15 = C.int64_t(15)
var param16 = C.int64_t(16)

func RunPrimitive1() {
	C.primitive_testfunc1(param1, param2, param3, param4)
}

func RunPrimitive2() {
	C.primitive_testfunc2(param1)
}

func RunPrimitive3() {
	C.primitive_testfunc3(param1, param2, param3, param4, param5, param6, param7, param8)
}

func RunPrimitive4() {
	C.primitive_testfunc4(param1, param2, param3, param4, param5, param6, param7, param8,
		param9, param10, param11, param12, param13, param14, param15, param16)
}

var int8_param1 = C.int8_t(1)
var int8_param2 = C.int8_t(15)
var int8_param3 = C.int8_t(32)
var int8_param4 = C.int8_t(100)

func RunPrimitive5() {
	C.primitive_testfunc5(int8_param1, int8_param2, int8_param3, int8_param4)
}

var int16_param1 = C.int16_t(26)
var int16_param2 = C.int16_t(156)
var int16_param3 = C.int16_t(187)
var int16_param4 = C.int16_t(96)

func RunPrimitive6() {
	C.primitive_testfunc6(int16_param1, int16_param2, int16_param3, int16_param4)
}

var int32_param1 = C.int32_t(2894)
var int32_param2 = C.int32_t(156)
var int32_param3 = C.int32_t(1846)
var int32_param4 = C.int32_t(333)

func RunPrimitive7() {
	C.primitive_testfunc7(int32_param1, int32_param2, int32_param3, int32_param4)
}
