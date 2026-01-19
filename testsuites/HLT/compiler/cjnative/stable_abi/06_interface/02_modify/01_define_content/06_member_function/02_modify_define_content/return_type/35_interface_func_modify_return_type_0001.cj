/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.6.2.35
  @Scene: modify
  @Visibility: public
  @Object: interface func
  @Behavior: modify function return type 
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
// ASSERT: scan Incompatible!
// ASSERT: scan-4 [API/ABI] Changed return type of function visible outside the module.
// ASSERT: scan-not [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-4 [API/ABI]

package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public interface F1 { func g() {1} }
public interface F2 <: F1 {}
public class S1 <: F2 {}
public struct S2 <: F2 {}
public interface I {
    static func g1(): S1 {S1()}
    func g2(): S1 {S1()}
    static func g3(): S1
    func g4(): S1
}
