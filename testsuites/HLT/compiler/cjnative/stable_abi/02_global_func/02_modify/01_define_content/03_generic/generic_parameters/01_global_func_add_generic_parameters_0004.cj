/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 2.2.1.3.1
  @Scene: modify
  @Visibility: non public
  @Object: global func
  @Behavior: add generic parameters
  @Expect: api compatible & abi compatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test global func: modify generic parameters
// global func: non public global func
// modify operation: add generic parameters
public class A {}
func global_func_01<T1, T2, T3>() where T1 <: A, T2 <: A { 0 }
func global_func_02<T1, T2, T3>() { 0 }
func global_func_03<T1, T2>() { 0 }
const func global_func_04<T1, T2>() { 0 }
public func global_func_05<T1, T2>() { 0 }
public const func global_func_06<T1, T2, T3>() { global_func_04<T1, T2>() }
@Frozen public func global_func_07() { global_func_03<A, A>() }

public func global_func_08() {
    global_func_02<A, A>() == 0
}
