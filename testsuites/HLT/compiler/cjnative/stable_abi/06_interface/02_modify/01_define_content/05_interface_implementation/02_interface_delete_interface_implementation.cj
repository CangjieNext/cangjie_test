/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.5.2
  @Scene: modify
  @Visibility: public
  @Object: interface
  @Behavior: delete interface implementation
  @Expect: api incompatible & abi incompatible
*/

// LEVEL: 1 
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible
// ASSERT: scan-1 [API/ABI] Deleted interfaces that interface implemented.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

public interface I1 { static func g1() {1} }
public interface I2 { static func g2() {1} }
public interface I3 { static func g3() {1} }
public interface I4 <: I1 { static func g4() {1} }
public func f() { I3.g3() }
