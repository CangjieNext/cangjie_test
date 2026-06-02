/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.6.2.2
  @Scene: add
  @Visibility: public
  @Object: enum static func
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

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare %f
// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Changed member function's annotation of enum visible outside the module. Deprecated strict added.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test enum: add @Deprecated
// 带public修饰符静态成员函数添加@Deprecated且下游不可用
package test_stable_abi

public enum E {
    | A
    @Deprecated["deprecated", strict: true] public static func g1() {1}
    @Deprecated["deprecated", strict: false] public static func g2() {1}
    @Deprecated["deprecated", strict: true] public static func g3() {1}
    static func g4() {1}
    @Deprecated["deprecated", strict: false] static func g5() {1}
    @Deprecated["deprecated", strict: true] static func g6() {1}
}
@Frozen public func f1() {E.g4() + E.g5()}
@Deprecated["deprecated", strict: true] @Frozen public func f2() {E.g3() + E.g6()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E.g4(), 1)
    assert(E.g5(), 1)
}
