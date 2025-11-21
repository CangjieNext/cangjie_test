/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 2.2.1.4.13
  @Scene: modify
  @Visibility: non public
  @Object: global func
  @Behavior: modify return type
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

// test global func: modify return type
// global func: non public global func
// modify operation: type A <: I, modify type A -> I
public interface I {}
public interface A <: I { func test() { 0 } }
public class B <: A { const init() {} }
public struct C <: A { const init() {} }
func global_func_01(): I { B() }
func global_func_11(): I { C() }
func global_func_02(): A { B() }
func global_func_12(): A { C() }
const func global_func_03(): A { B() }
const func global_func_13(): A { C() }
public func global_func_04(): A { B() }
public func global_func_14(): A { C() }
public const func global_func_05() { global_func_03() }
public const func global_func_15() { global_func_13() }
@Frozen public func global_func_06() { global_func_02() }
@Frozen public func global_func_16() { global_func_12() }

public func global_func_17() {
  true
}
