/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 2.2.1.2.1
  @Scene: modify
  @Visibility: public
  @Object: global func
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
// ASSERT: scan-1 [API/ABI] Function declaration visible outside the module made protected or internal.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

// test global func: modify access modifier eg: public/protected/internal/private
// global func: non public global func
// modify operation: delete public modifier
func global_func_01() { 0 }
protected func global_func_02() { 0 }
protected func global_func_03() { 0 }
internal func global_func_04() { 0 }
internal func global_func_05() { 0 }
private func global_func_06() { 0 }
private func global_func_07() { 0 }
func global_func_08() { 0 }
func global_func_09() { 0 }
func global_func_10() { 0 }

public func global_func_11() {
    global_func_08() == 0
    && global_func_10() == 0
    && global_func_02() == 0
    && global_func_04() == 0
    && global_func_06() == 0
    && global_func_09() == 0
    && global_func_03() == 0
    && global_func_05() == 0
    && global_func_07() == 0
}
