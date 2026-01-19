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
  @Visibility: used in public const declare
  @Object: global func
  @Behavior: modify return type
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --api 2>&1 | compare template.cj
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo --abi 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [ABI] The body of a const function or function marked with @Frozen changed.
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test global func: modify return type
// global func: global func is used in const global var/func
// modify operation: class type B <: A, modify type A -> B
public interface I {}
public interface A <: I { func test() { 0 } }
public class B <: A { const init() {} }
public struct C <: A { const init() {} }
func global_func_01(): A { B() }
func global_func_11(): A { C() }
func global_func_02(): A { B() }
func global_func_12(): A { C() }
const func global_func_03(): B { B() }
const func global_func_13(): A { C() }
public func global_func_04(): A { B() }
public func global_func_14(): A { C() }
public const func global_func_05() { global_func_03() }
public const func global_func_15() { global_func_13() }
@Frozen public func global_func_06() { global_func_02() }
@Frozen public func global_func_16() { global_func_12() }

public func global_func_17() {
    global_func_01().test() == 0
    && global_func_11().test() == 0
}
