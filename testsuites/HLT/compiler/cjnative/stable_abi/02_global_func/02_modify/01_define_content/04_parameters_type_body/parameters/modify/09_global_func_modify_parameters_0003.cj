/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 2.2.1.4.9
  @Scene: modify
  @Visibility: used in public @Frozen declare
  @Object: global func
  @Behavior: modify parameters type
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-3 [ABI] Changed parameter type of function visible outside the module.
// ASSERT: scan-3 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-6 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test global func: modify parameters
// global func: global func is used in @Frozen global func
// modify operation: modify parameters type A -> B, A <: B
public interface I {}
extend Int64 <: I {}
func global_func_01() { 0 }
func global_func_11(a: Int64) { 0 }
func global_func_21(a!: Int64) { 0 }
func global_func_31(a!: Int64 = 0) { 0 }
func global_func_02() { 0 }
func global_func_12(a: I) { 0 }
func global_func_22(a!: I) { 0 }
func global_func_32(a!: I = 0) { 0 }
const func global_func_03() { 0 }
const func global_func_13(a: Int64) { 0 }
const func global_func_23(a!: Int64) { 0 }
const func global_func_33(a!: Int64 = 0) { 0 }
public func global_func_04() { 0 }
public func global_func_14(a: Int64) { 0 }
public func global_func_24(a!: Int64) { 0 }
public func global_func_34(a!: Int64 = 0) { 0 }
public const func global_func_05() { global_func_03() }
public const func global_func_15(a: Int64) { global_func_13(0) }
public const func global_func_25(a!: Int64) { global_func_23(a: 0) }
public const func global_func_35(a!: Int64 = 0) { global_func_33(a: 0) }
@Frozen public func global_func_06() { global_func_02() }
@Frozen public func global_func_16() { global_func_12(0) }
@Frozen public func global_func_26() { global_func_22(a: 0) }
@Frozen public func global_func_36() { global_func_32(a: 0) }
func global_func_41(a: Int32, b: Int64) { 0 }
func global_func_42(a: Int32, b: Int64) { 0 }
const func global_func_43(a: Int32, b: Int64) { 0 }
public func global_func_44(a: Int32, b: Int64) { 0 }
public const func global_func_45(a: Int32, b: Int64) { global_func_43(0, 0) }
@Frozen public func global_func_46(a: Int32, b: Int64) { global_func_42(0, 0) }
func global_func_51(a!: Int32, b!: Int64) { 0 }
func global_func_52(a!: Int32, b!: Int64) { 0 }
const func global_func_53(a!: Int32, b!: Int64) { 0 }
public func global_func_54(a!: Int32, b!: Int64) { 0 }
public const func global_func_55(a!: Int32, b!: Int64) { global_func_53(a: 0, b: 0) }
@Frozen public func global_func_56(a!: Int32, b!: Int64) { global_func_52(a: 0, b: 0) }
