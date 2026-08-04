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
// BenchmarkCffiStruct1
//------------------------------------------------------------------
struct Data64
{
    int8_t a0;
    int8_t a1;
    int16_t a2;
    int16_t a3;
    int32_t a4;
    int32_t a5;
    int64_t a6;
    int64_t a7;
    int8_t a8;
    int8_t a9;
    int16_t a10;
    int16_t a11;
    int32_t a12;
    int32_t a13;
    int64_t a14;
    int64_t a15;
};

int32_t cstruct_testfunc1(struct Data64 param1, struct Data64 param2, struct Data64 param3, struct Data64 param4)
{
    int32_t res = param1.a0 + param2.a2 + param3.a4 + param4.a8;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiStruct2
//------------------------------------------------------------------
struct Data24
{
    int8_t a0;
    int8_t a1;
    int16_t a2;
    int16_t a3;
    int32_t a4;
    int32_t a5;
    int64_t a6;
};

int32_t cstruct_testfunc2(struct Data24 param1, struct Data24 param2, struct Data24 param3, struct Data24 param4)
{
    int32_t res = param1.a0 + param2.a2 + param3.a4 + param4.a6;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiStruct3
//------------------------------------------------------------------
struct Data32
{
    int8_t a0;
    int8_t a1;
    int16_t a2;
    int16_t a3;
    int32_t a4;
    int32_t a5;
    int64_t a6;
    int64_t a7;
};

int32_t cstruct_testfunc3(struct Data32 param1, struct Data32 param2, struct Data32 param3, struct Data32 param4)
{
    int32_t res = param1.a0 + param2.a2 + param3.a4 + param4.a7;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiStruct4
//------------------------------------------------------------------
struct Data256
{
    int8_t a0;
    int8_t a1;
    int16_t a2;
    int16_t a3;
    int32_t a4;
    int32_t a5;
    int64_t a6;
    int64_t a7;
    int8_t a8;
    int8_t a9;
    int16_t a10;
    int16_t a11;
    int32_t a12;
    int32_t a13;
    int64_t a14;
    int64_t a15;
    int64_t a16;
    int64_t a17;
    int64_t a18;
    int64_t a19;
    int64_t a20;
    int64_t a21;
    int64_t a22;
    int64_t a23;
    int64_t a24;
    int64_t a25;
    int64_t a26;
    int64_t a27;
    int64_t a28;
    int64_t a29;
    int64_t a30;
    int64_t a31;
    int64_t a32;
    int64_t a33;
    int64_t a34;
    int64_t a35;
    int64_t a36;
    int64_t a37;
    int64_t a38;
    int64_t a39;
};

int32_t cstruct_testfunc4(struct Data256 param1, struct Data256 param2, struct Data256 param3, struct Data256 param4)
{
    int32_t res = param1.a0 + param2.a2 + param3.a4 + param4.a8;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiStruct5
//------------------------------------------------------------------
struct Data512
{
    int8_t a0;
    int8_t a1;
    int16_t a2;
    int16_t a3;
    int32_t a4;
    int32_t a5;
    int64_t a6;
    int64_t a7;
    int8_t a8;
    int8_t a9;
    int16_t a10;
    int16_t a11;
    int32_t a12;
    int32_t a13;
    int64_t a14;
    int64_t a15;
    int64_t a16;
    int64_t a17;
    int64_t a18;
    int64_t a19;
    int64_t a20;
    int64_t a21;
    int64_t a22;
    int64_t a23;
    int64_t a24;
    int64_t a25;
    int64_t a26;
    int64_t a27;
    int64_t a28;
    int64_t a29;
    int64_t a30;
    int64_t a31;
    int64_t a32;
    int64_t a33;
    int64_t a34;
    int64_t a35;
    int64_t a36;
    int64_t a37;
    int64_t a38;
    int64_t a39;
    int64_t a40;
    int64_t a41;
    int64_t a42;
    int64_t a43;
    int64_t a44;
    int64_t a45;
    int64_t a46;
    int64_t a47;
    int64_t a48;
    int64_t a49;
    int64_t a50;
    int64_t a51;
    int64_t a52;
    int64_t a53;
    int64_t a54;
    int64_t a55;
    int64_t a56;
    int64_t a57;
    int64_t a58;
    int64_t a59;
    int64_t a60;
    int64_t a61;
    int64_t a62;
    int64_t a63;
    int64_t a64;
    int64_t a65;
    int64_t a66;
    int64_t a67;
    int64_t a68;
    int64_t a69;
    int64_t a70;
    int64_t a71;
};

int32_t cstruct_testfunc5(struct Data512 param1, struct Data512 param2, struct Data512 param3, struct Data512 param4)
{
    int32_t res = param1.a0 + param2.a2 + param3.a4 + param4.a8;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiStruct6
//------------------------------------------------------------------
int32_t cstruct_testfunc6(struct Data64 param1)
{
    int32_t res = param1.a0 + param1.a2 + param1.a4 + param1.a8;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiStruct7
//------------------------------------------------------------------
int32_t cstruct_testfunc7(struct Data64 param1, struct Data64 param2, struct Data64 param3, struct Data64 param4,
                          struct Data64 param5, struct Data64 param6, struct Data64 param7, struct Data64 param8)
{
    int32_t res = param1.a0 + param2.a2 + param3.a4 + param4.a8 - param5.a0 - param6.a2 - param7.a4 - param8.a8;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiStruct8
//------------------------------------------------------------------
int32_t cstruct_testfunc8(struct Data64 param1, struct Data64 param2, struct Data64 param3, struct Data64 param4,
                          struct Data64 param5, struct Data64 param6, struct Data64 param7, struct Data64 param8,
                          struct Data64 param9, struct Data64 param10, struct Data64 param11, struct Data64 param12,
                          struct Data64 param13, struct Data64 param14, struct Data64 param15, struct Data64 param16)
{
    int32_t res = param1.a0 + param2.a2 + param3.a4 + param4.a8 + param5.a0 + param6.a2 + param7.a4 + param8.a8 -
                  param9.a0 - param10.a2 - param11.a4 - param12.a8 - param13.a0 - param14.a2 - param15.a4 + param16.a8;
    return res;
}
*/
import "C"

var st11 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st12 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st13 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st14 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}

func RunStruct1() {
	var res = C.cstruct_testfunc1(st11, st12, st13, st14)
	_ = res
}

var st21 = C.struct_Data24{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7}
var st22 = C.struct_Data24{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7}
var st23 = C.struct_Data24{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7}
var st24 = C.struct_Data24{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7}

func RunStruct2() {
	var res = C.cstruct_testfunc2(st21, st22, st23, st24)
	_ = res
}

var st31 = C.struct_Data32{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8}
var st32 = C.struct_Data32{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8}
var st33 = C.struct_Data32{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8}
var st34 = C.struct_Data32{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8}

func RunStruct3() {
	var res = C.cstruct_testfunc3(st31, st32, st33, st34)
	_ = res
}

var st41 = C.struct_Data256{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16,
	a16: 17, a17: 18, a18: 19, a19: 20, a20: 21, a21: 22, a22: 23, a23: 24, a24: 25, a25: 26, a26: 27, a27: 28, a28: 29, a29: 30, a30: 31, a31: 32,
	a32: 33, a33: 34, a34: 35, a35: 36, a36: 37, a37: 38, a38: 39, a39: 40}
var st42 = C.struct_Data256{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16,
	a16: 17, a17: 18, a18: 19, a19: 20, a20: 21, a21: 22, a22: 23, a23: 24, a24: 25, a25: 26, a26: 27, a27: 28, a28: 29, a29: 30, a30: 31, a31: 32,
	a32: 33, a33: 34, a34: 35, a35: 36, a36: 37, a37: 38, a38: 39, a39: 40}
var st43 = C.struct_Data256{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16,
	a16: 17, a17: 18, a18: 19, a19: 20, a20: 21, a21: 22, a22: 23, a23: 24, a24: 25, a25: 26, a26: 27, a27: 28, a28: 29, a29: 30, a30: 31, a31: 32,
	a32: 33, a33: 34, a34: 35, a35: 36, a36: 37, a37: 38, a38: 39, a39: 40}
var st44 = C.struct_Data256{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16,
	a16: 17, a17: 18, a18: 19, a19: 20, a20: 21, a21: 22, a22: 23, a23: 24, a24: 25, a25: 26, a26: 27, a27: 28, a28: 29, a29: 30, a30: 31, a31: 32,
	a32: 33, a33: 34, a34: 35, a35: 36, a36: 37, a37: 38, a38: 39, a39: 40}

func RunStruct4() {
	var res = C.cstruct_testfunc4(st41, st42, st43, st44)
	_ = res
}

var st51 = C.struct_Data512{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16,
	a16: 17, a17: 18, a18: 19, a19: 20, a20: 21, a21: 22, a22: 23, a23: 24, a24: 25, a25: 26, a26: 27, a27: 28, a28: 29, a29: 30, a30: 31, a31: 32,
	a32: 33, a33: 34, a34: 35, a35: 36, a36: 37, a37: 38, a38: 39, a39: 40, a40: 41, a41: 42, a42: 43, a43: 44, a44: 45, a45: 46, a46: 47, a47: 48,
	a48: 49, a49: 50, a50: 51, a51: 52, a52: 53, a53: 54, a54: 55, a55: 56, a56: 57, a57: 58, a58: 59, a59: 60, a60: 61, a61: 62, a62: 63, a63: 64,
	a64: 65, a65: 66, a66: 67, a67: 68, a68: 69, a69: 70, a70: 71, a71: 72}
var st52 = C.struct_Data512{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16,
	a16: 17, a17: 18, a18: 19, a19: 20, a20: 21, a21: 22, a22: 23, a23: 24, a24: 25, a25: 26, a26: 27, a27: 28, a28: 29, a29: 30, a30: 31, a31: 32,
	a32: 33, a33: 34, a34: 35, a35: 36, a36: 37, a37: 38, a38: 39, a39: 40, a40: 41, a41: 42, a42: 43, a43: 44, a44: 45, a45: 46, a46: 47, a47: 48,
	a48: 49, a49: 50, a50: 51, a51: 52, a52: 53, a53: 54, a54: 55, a55: 56, a56: 57, a57: 58, a58: 59, a59: 60, a60: 61, a61: 62, a62: 63, a63: 64,
	a64: 65, a65: 66, a66: 67, a67: 68, a68: 69, a69: 70, a70: 71, a71: 72}
var st53 = C.struct_Data512{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16,
	a16: 17, a17: 18, a18: 19, a19: 20, a20: 21, a21: 22, a22: 23, a23: 24, a24: 25, a25: 26, a26: 27, a27: 28, a28: 29, a29: 30, a30: 31, a31: 32,
	a32: 33, a33: 34, a34: 35, a35: 36, a36: 37, a37: 38, a38: 39, a39: 40, a40: 41, a41: 42, a42: 43, a43: 44, a44: 45, a45: 46, a46: 47, a47: 48,
	a48: 49, a49: 50, a50: 51, a51: 52, a52: 53, a53: 54, a54: 55, a55: 56, a56: 57, a57: 58, a58: 59, a59: 60, a60: 61, a61: 62, a62: 63, a63: 64,
	a64: 65, a65: 66, a66: 67, a67: 68, a68: 69, a69: 70, a70: 71, a71: 72}
var st54 = C.struct_Data512{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16,
	a16: 17, a17: 18, a18: 19, a19: 20, a20: 21, a21: 22, a22: 23, a23: 24, a24: 25, a25: 26, a26: 27, a27: 28, a28: 29, a29: 30, a30: 31, a31: 32,
	a32: 33, a33: 34, a34: 35, a35: 36, a36: 37, a37: 38, a38: 39, a39: 40, a40: 41, a41: 42, a42: 43, a43: 44, a44: 45, a45: 46, a46: 47, a47: 48,
	a48: 49, a49: 50, a50: 51, a51: 52, a52: 53, a53: 54, a54: 55, a55: 56, a56: 57, a57: 58, a58: 59, a59: 60, a60: 61, a61: 62, a62: 63, a63: 64,
	a64: 65, a65: 66, a66: 67, a67: 68, a68: 69, a69: 70, a70: 71, a71: 72}

func RunStruct5() {
	var res = C.cstruct_testfunc5(st51, st52, st53, st54)
	_ = res
}

func RunStruct6() {
	var res = C.cstruct_testfunc6(st11)
	_ = res
}

var st71 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st72 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st73 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st74 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}

func RunStruct7() {
	var res = C.cstruct_testfunc7(st11, st12, st13, st14, st71, st72, st73, st74)
	_ = res
}

var st81 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st82 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st83 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st84 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st85 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st86 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st87 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}
var st88 = C.struct_Data64{a0: 1, a1: 2, a2: 3, a3: 4, a4: 5, a5: 6, a6: 7, a7: 8, a8: 9, a9: 10, a10: 11, a11: 12, a12: 13, a13: 14, a14: 15, a15: 16}

func RunStruct8() {
	var res = C.cstruct_testfunc8(st11, st12, st13, st14, st71, st72, st73, st74, st81, st82, st83, st84, st85, st86, st87, st88)
	_ = res
}
