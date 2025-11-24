/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 2.2.1.1.8
  @Scene: modify
  @Visibility: public
  @Object: global func
  @Behavior: add/delete/modify @CallingConv, change calling convention
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 0-core
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] Modified function Call Convention annotation without same argument convention compilation error.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test global func: modify compiler directive
// global func: public global func
// modify operation: modify @CallingConv[CDECL] -> @CallingConv[STDCALL]
@C func global_func_01() { 0 }
@C func global_func_02() { 0 }
@C const func global_func_03() { 0 }
@CallingConv[CDECL] @C func global_func_04() { 0 }
@CallingConv[CDECL] @C func global_func_05() { 0 }
@CallingConv[CDECL] @C const func global_func_06() { 0 }
@CallingConv[STDCALL] @C func global_func_07() { 0 }
@CallingConv[STDCALL] @C func global_func_08() { 0 }
@CallingConv[STDCALL] @C const func global_func_09() { 0 }

@C public func global_func_10() { 0 }
@CallingConv[STDCALL] @C public func global_func_11() { 0 }
@CallingConv[STDCALL] @C public func global_func_12() { 0 }

public unsafe const func global_func_13() { global_func_03() }
public unsafe const func global_func_14() { global_func_06() }
public unsafe const func global_func_15() { global_func_09() }

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

public  unsafe func global_func_19() {
    global_func_01() == 0
    && global_func_07() == 0
}
