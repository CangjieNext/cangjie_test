/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 2.2.1.1.6
  @Scene: modify
  @Visibility: public
  @Object: global func
  @Behavior: add @C
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
// ASSERT: scan-1 [API/ABI] Added function C attribute without unsafe compilation error.
// ASSERT: scan-1 [ABI] Modified function Call Convention annotation without same argument convention compilation error.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-1 [ABI]

package test_stable_abi

// test global func: modify compiler directive
// global func: public global func
// modify operation: add @C
func global_func_01() { 0 }
func global_func_02() { 0 }
const func global_func_03() { 0 }
@C public func global_func_04() { 0 }
public unsafe const func global_func_05() { global_func_03() }
@Frozen public unsafe func global_func_06() { global_func_02() }
