/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.4.5
  @Scene: modify
  @Visibility: public
  @Object: interface
  @Behavior: add generic constraints
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

// ASSERT: scan Incompatible
// ASSERT: scan-1 [API/ABI] Added generic constraint of interface visible outside the module.
// ASSERT: scan-1 [API/ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]

package test_stable_abi

public interface F1 { static func g() {1} }
public interface F2 { static func g() {1} }
public interface S1 <: F1 {}
public interface S2 <: S1 & F2 { static func g() {2} }
public interface I<T1, T2, T3> where T1 <: F1 & F2, T2 <: S1 & F1 {
    static func g(a: T1, b: T2) { 1 }
}
