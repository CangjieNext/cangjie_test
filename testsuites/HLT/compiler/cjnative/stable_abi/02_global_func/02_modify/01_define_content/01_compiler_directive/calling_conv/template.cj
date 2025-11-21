/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test global func: modify compiler directive
@C
func global_func_01() {
    0
}

@C
func global_func_02() {
    0
}

@C
const func global_func_03() {
    0
}

@CallingConv[CDECL]
@C
func global_func_04() {
    0
}

@CallingConv[CDECL]
@C
func global_func_05() {
    0
}

@CallingConv[CDECL]
@C
const func global_func_06() {
    0
}

@CallingConv[STDCALL]
@C
func global_func_07() {
    0
}

@CallingConv[STDCALL]
@C
func global_func_08() {
    0
}

@CallingConv[STDCALL]
@C
const func global_func_09() {
    0
}

@C
public func global_func_10() {
    0
}

@CallingConv[CDECL]
@C
public func global_func_11() {
    0
}

@CallingConv[STDCALL]
@C
public func global_func_12() {
    0
}

public unsafe const func global_func_13() {
    global_func_03()
}

public unsafe const func global_func_14() {
    global_func_06()
}

public unsafe const func global_func_15() {
    global_func_09()
}

@Frozen
public unsafe func global_func_16() {
    global_func_02()
}

@Frozen
public unsafe func global_func_17() {
    global_func_05()
}

@Frozen
public unsafe func global_func_18() {
    global_func_08()
}

public func global_func_19() {
    unsafe { global_func_01() == 0 } && unsafe { global_func_07() == 0 }
}
