/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 2.2.1.4.14
  @Scene: modify
  @Visibility: non public
  @Object: global func
  @Behavior: modify const or @Frozen function body
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

// test global func: modify body
// global func: non public global func
// modify operation: modify const body
func global_func_01() { 0 }
func global_func_02() { 0 }
const func global_func_11() { 1;0 }
const func global_func_12() { 0 }
const func global_func_13() { 0 }
@Frozen func global_func_21() { 0 }
@Frozen func global_func_22() { 0 }
@Frozen const func global_func_23() { 0 }

public func global_func_04() { 0 }
public const func global_func_14() { 0 }
@Frozen public func global_func_24() { 0 }

public const func global_func_15() { global_func_13() }
@Frozen public const func global_func_25() { global_func_23() }

@Frozen
public func global_func_06() {
    global_func_02()
}

@Frozen
public const func global_func_16() {
    global_func_12()
}

@Frozen
public func global_func_26() {
    global_func_22()
}
