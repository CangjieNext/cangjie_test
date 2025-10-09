/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 1.2.1.2.1
  @Scene: modify
  @Visibility: public
  @Object: global var
  @Behavior: modifier: public -> non public
  @Expect: api incompatible & abi incompatible
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
// ASSERT: scan-1 [API/ABI] Variable declaration visible outside the module deleted or made private.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test global var: modify access modifier eg: public/protected/internal/private
// global var: public global var
// modify operation: modify public modifier -> non public modifier
private var global_var_01: Int64 = 0
protected var global_var_02: Int64 = 0
protected var global_var_03: Int64 = 0
internal var global_var_04: Int64 = 0
internal var global_var_05: Int64 = 0
private var global_var_06: Int64 = 0
private var global_var_07: Int64 = 0
var global_var_08: Int64 = 0
var global_var_09: Int64 = 0
var global_var_10: Int64 = 0
