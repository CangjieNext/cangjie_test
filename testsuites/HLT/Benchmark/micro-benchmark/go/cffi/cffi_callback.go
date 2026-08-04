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

typedef void (*callback)();
void run1(callback cb);

void run2(callback cb1, callback cb2, callback cb3, callback cb4);

void run3(callback cb1, callback cb2, callback cb3, callback cb4,
          callback cb5, callback cb6, callback cb7, callback cb8);

void run4(callback cb1, callback cb2, callback cb3, callback cb4,
          callback cb5, callback cb6, callback cb7, callback cb8,
          callback cb9, callback cb10, callback cb11, callback cb12,
          callback cb13, callback cb14, callback cb15, callback cb16);

void callableInC1();
void callableInC2();
void callableInC3();
void callableInC4();
void callableInC5();
void callableInC6();
void callableInC7();
void callableInC8();
void callableInC9();
void callableInC10();
void callableInC11();
void callableInC12();
void callableInC13();
void callableInC14();
void callableInC15();
void callableInC16();
*/
import "C"

//export callableInC1
func callableInC1() {
}

//export callableInC2
func callableInC2() {
}

//export callableInC3
func callableInC3() {
}

//export callableInC4
func callableInC4() {
}

//export callableInC5
func callableInC5() {
}

//export callableInC6
func callableInC6() {
}

//export callableInC7
func callableInC7() {
}

//export callableInC8
func callableInC8() {
}

//export callableInC9
func callableInC9() {
}

//export callableInC10
func callableInC10() {
}

//export callableInC11
func callableInC11() {
}

//export callableInC12
func callableInC12() {
}

//export callableInC13
func callableInC13() {
}

//export callableInC14
func callableInC14() {
}

//export callableInC15
func callableInC15() {
}

//export callableInC16
func callableInC16() {
}

func RunCallback1() {
	C.run1(C.callback(C.callableInC1))
}

func RunCallback2() {
	C.run2(C.callback(C.callableInC1), C.callback(C.callableInC2), C.callback(C.callableInC3), C.callback(C.callableInC4))
}

func RunCallback3() {
	C.run3(C.callback(C.callableInC1), C.callback(C.callableInC2), C.callback(C.callableInC3), C.callback(C.callableInC4),
		C.callback(C.callableInC5), C.callback(C.callableInC6), C.callback(C.callableInC7), C.callback(C.callableInC8))
}

func RunCallback4() {
	C.run4(C.callback(C.callableInC1), C.callback(C.callableInC2), C.callback(C.callableInC3), C.callback(C.callableInC4),
		C.callback(C.callableInC5), C.callback(C.callableInC6), C.callback(C.callableInC7), C.callback(C.callableInC8),
		C.callback(C.callableInC9), C.callback(C.callableInC10), C.callback(C.callableInC11), C.callback(C.callableInC12),
		C.callback(C.callableInC13), C.callback(C.callableInC14), C.callback(C.callableInC15), C.callback(C.callableInC16))
}
