/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.6.2.23
  @Scene: delete
  @Visibility: public
  @Object: interface func
  @Behavior: delete generics constraint
  @Expect: api compatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-2 [ABI] Deleted generic constraint of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]
// ASSERT: scan-2 [ABI]

package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public interface F1 { static func g() {1} }
public interface F2 { static func g() {1} }
public open class S1 <: F1 {}
public class S2 <: S1 & F2 { public static func g() {2} }
public interface I {
    static func g1<T1, T2, T3>(a: T1, b: T2) where T1 <: F1 & F2 { 1 }
    func g2<T1, T2, T3>(a: T1, b: T2) where T1 <: F1 & F2 { 1 }
}
public class C <: I {}
