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
#include <malloc.h>

//------------------------------------------------------------------
// BenchmarkCffiReturn1
//------------------------------------------------------------------
int64_t return_testfunc1()
{
    int64_t res = 1;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn2
//------------------------------------------------------------------
int8_t return_testfunc2()
{
    int8_t res = 1;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn3
//------------------------------------------------------------------
int16_t return_testfunc3()
{
    int16_t res = 1;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn4
//------------------------------------------------------------------
int32_t return_testfunc4()
{
    int32_t res = 1;
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn5
//------------------------------------------------------------------
struct ReturnData24
{
    int8_t a0;
    int8_t a1;
    int16_t a2;
    int16_t a3;
    int32_t a4;
    int32_t a5;
    int64_t a6;
};

struct ReturnData24 return_testfunc5()
{
    struct ReturnData24 res = {1, 2, 3, 4, 5, 6, 7};
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn6
//------------------------------------------------------------------
struct ReturnData32
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

struct ReturnData32 return_testfunc6()
{
    struct ReturnData32 res = {1, 2, 3, 4, 5, 6, 7, 8};
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn7
//------------------------------------------------------------------
struct ReturnData64
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

struct ReturnData64 return_testfunc7()
{
    struct ReturnData64 res = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn8
//------------------------------------------------------------------
struct ReturnData256
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

struct ReturnData256 return_testfunc8()
{
    struct ReturnData256 res = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn9
//------------------------------------------------------------------
struct ReturnData512
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

struct ReturnData512 return_testfunc9()
{
    struct ReturnData512 res = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn10
//------------------------------------------------------------------
struct ReturnData1024
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
    int64_t a72;
    int64_t a73;
    int64_t a74;
    int64_t a75;
    int64_t a76;
    int64_t a77;
    int64_t a78;
    int64_t a79;
    int64_t a80;
    int64_t a81;
    int64_t a82;
    int64_t a83;
    int64_t a84;
    int64_t a85;
    int64_t a86;
    int64_t a87;
    int64_t a88;
    int64_t a89;
    int64_t a90;
    int64_t a91;
    int64_t a92;
    int64_t a93;
    int64_t a94;
    int64_t a95;
    int64_t a96;
    int64_t a97;
    int64_t a98;
    int64_t a99;
    int64_t a100;
    int64_t a101;
    int64_t a102;
    int64_t a103;
    int64_t a104;
    int64_t a105;
    int64_t a106;
    int64_t a107;
    int64_t a108;
    int64_t a109;
    int64_t a110;
    int64_t a111;
    int64_t a112;
    int64_t a113;
    int64_t a114;
    int64_t a115;
    int64_t a116;
    int64_t a117;
    int64_t a118;
    int64_t a119;
    int64_t a120;
    int64_t a121;
    int64_t a122;
    int64_t a123;
    int64_t a124;
    int64_t a125;
    int64_t a126;
    int64_t a127;
    int64_t a128;
    int64_t a129;
    int64_t a130;
    int64_t a131;
    int64_t a132;
    int64_t a133;
    int64_t a134;
    int64_t a135;
};

struct ReturnData1024 return_testfunc10()
{
    struct ReturnData1024 res = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
    return res;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn11
//------------------------------------------------------------------
int64_t *return_testfunc11()
{
    int64_t *ptr = (int64_t *)malloc(sizeof(int64_t));
    ptr[0] = 1;
    return ptr;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn12
//------------------------------------------------------------------
struct ReturnData24 *return_testfunc12()
{
    struct ReturnData24 *ptr = (struct ReturnData24 *)malloc(sizeof(struct ReturnData24));
    ptr->a0 = 1;
    ptr->a1 = 2;
    ptr->a2 = 3;
    ptr->a3 = 4;
    ptr->a4 = 5;
    ptr->a5 = 6;
    ptr->a6 = 7;
    return ptr;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn13
//------------------------------------------------------------------
typedef int32_t *(*return_func_ty)();

int32_t *return_func1()
{
    return 0;
};

return_func_ty return_testfunc13()
{
    return_func_ty ret = &return_func1;
    return ret;
}

//------------------------------------------------------------------
// BenchmarkCffiReturn14
//------------------------------------------------------------------
char *return_testfunc14()
{
    char *res = "123456";
    return res;
}
*/
import "C"

func RunReturn1() {
	var res = C.return_testfunc1()
	_ = res
}

func RunReturn2() {
	var res = C.return_testfunc2()
	_ = res
}

func RunReturn3() {
	var res = C.return_testfunc3()
	_ = res
}

func RunReturn4() {
	var res = C.return_testfunc4()
	_ = res
}

func RunReturn5() {
	var res = C.return_testfunc5()
	_ = res
}

func RunReturn6() {
	var res = C.return_testfunc6()
	_ = res
}

func RunReturn7() {
	var res = C.return_testfunc7()
	_ = res
}

func RunReturn8() {
	var res = C.return_testfunc8()
	_ = res
}

func RunReturn9() {
	var res = C.return_testfunc9()
	_ = res
}

func RunReturn10() {
	var res = C.return_testfunc10()
	_ = res
}

func RunReturn11() {
	var res = C.return_testfunc11()
	_ = res
}

func RunReturn12() {
	var res = C.return_testfunc12()
	_ = res
}

func RunReturn13() {
	var res = C.return_testfunc13()
	_ = res
}

func RunReturn14() {
	var res = C.return_testfunc14()
	_ = res
}
