/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.6.2.15
  @Scene: delete
  @Visibility: public
  @Object: enum static func
  @Behavior: delete const modifier
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
// ASSERT: scan-2 [API/ABI] Changed member function's modifier of enum visible outside the module. public/const/static deleted or const/static added.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-2 [API/ABI]

// test enum: delete access modifier: const
package test_stable_abi

public enum E {
    | A
    public static func g1() {1}
    public static func g2() {1}
    static func g3() {1}
    static func g4() {1}
}
@Frozen public func f() {E.g3() + E.g4()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
