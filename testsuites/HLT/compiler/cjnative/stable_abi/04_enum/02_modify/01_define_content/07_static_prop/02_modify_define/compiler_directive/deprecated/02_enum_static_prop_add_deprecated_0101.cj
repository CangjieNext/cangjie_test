/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.7.2.2
  @Scene: add
  @Visibility: public
  @Object: enum static prop
  @Behavior: add @Deprecated, strict: true
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
// ASSERT: scan-1 [API/ABI] Changed member property's annotation of enum visible outside the module. Deprecated strict added.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test struct: add @Deprecated
package test_stable_abi

public enum E {
    | A
    @Deprecated["deprecated", strict: true] public static prop p1: Int64 {get(){1}}
    @Deprecated["deprecated", strict: false] public static prop p2: Int64 {get(){1}}
    @Deprecated["deprecated", strict: true] public static prop p3: Int64 {get(){1}}
    static prop p4: Int64 {get(){1}}
    @Deprecated["deprecated", strict: false] static prop p5: Int64 {get(){1}}
    @Deprecated["deprecated", strict: true] static prop p6: Int64 {get(){1}}
}
@Frozen public func f1() {E.p4 + E.p5}
@Deprecated["deprecated", strict: true] @Frozen public func f2() {E.p3 + E.p6}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E.p4, 1)
    assert(E.p5, 1)
}
