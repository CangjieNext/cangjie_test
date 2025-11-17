/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.6.2.22
  @Scene: add
  @Visibility: public
  @Object: enum static func
  @Behavior: add generics constraints
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

// ASSERT: scan Incompatible!
// ASSERT: scan-2 [API/ABI] Added generic constraint of function visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-2 [API/ABI]

// test enum: add public function generics constraint
package test_stable_abi

public interface I1 {public func f() {1}}
public interface I2 {}
public open class C1 <: I1 {}
public class C2 <: C1 & I2 {}
public enum E {
    | A
    public static func g1<T1, T2>(a: T1, b: T2) where T1 <: I1 & I2, T2 <: C1 & I1 {a.f() + b.f()}
    static func g2<T1, T2>(a: T1, b: T2) where T1 <: I1 & I2, T2 <: C1 & I1 {a.f() + b.f()}
}
@Frozen public func f() {E.g2<C2, C1>(C2(), C1())}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
