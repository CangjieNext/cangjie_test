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
// BenchmarkCffiCString1
//------------------------------------------------------------------
int32_t cstring_testfunc1(char *param1)
{
    return 0;
}

//------------------------------------------------------------------
// BenchmarkCffiCString2
//------------------------------------------------------------------
int32_t cstring_testfunc2(char *param1, char *param2, char *param3, char *param4)
{
    return 0;
}

//------------------------------------------------------------------
// BenchmarkCffiCString3
//------------------------------------------------------------------
int32_t cstring_testfunc3(char *param1, char *param2, char *param3, char *param4,
                          char *param5, char *param6, char *param7, char *param8)
{
    return 0;
}

//------------------------------------------------------------------
// BenchmarkCffiCString4
//------------------------------------------------------------------
int32_t cstring_testfunc4(char *param1, char *param2, char *param3, char *param4,
                          char *param5, char *param6, char *param7, char *param8,
                          char *param9, char *param10, char *param11, char *param12,
                          char *param13, char *param14, char *param15, char *param16)
{
    return 0;
}
*/
import "C"

var cs11 = C.CString("test")

func RunCString1() {
	C.cstring_testfunc1(cs11)
}

var cs21 = C.CString("test1")
var cs22 = C.CString("test2")
var cs23 = C.CString("test3")
var cs24 = C.CString("test4")

func RunCString2() {
	C.cstring_testfunc2(cs21, cs22, cs23, cs24)
}

var cs31 = C.CString("test1")
var cs32 = C.CString("test2")
var cs33 = C.CString("test3")
var cs34 = C.CString("test4")
var cs35 = C.CString("test5")
var cs36 = C.CString("test6")
var cs37 = C.CString("test7")
var cs38 = C.CString("test8")

func RunCString3() {
	C.cstring_testfunc3(cs31, cs32, cs33, cs34, cs35, cs36, cs37, cs38)
}

var cs41 = C.CString("test1")
var cs42 = C.CString("test2")
var cs43 = C.CString("test3")
var cs44 = C.CString("test4")
var cs45 = C.CString("test5")
var cs46 = C.CString("test6")
var cs47 = C.CString("test7")
var cs48 = C.CString("test8")
var cs49 = C.CString("test9")
var cs410 = C.CString("test10")
var cs411 = C.CString("test11")
var cs412 = C.CString("test12")
var cs413 = C.CString("test13")
var cs414 = C.CString("test14")
var cs415 = C.CString("test15")
var cs416 = C.CString("test16")

func RunCString4() {
	C.cstring_testfunc4(cs41, cs42, cs43, cs44, cs45, cs46, cs47, cs48,
		cs49, cs410, cs411, cs412, cs413, cs414, cs415, cs416)
}
