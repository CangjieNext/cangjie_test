/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.2.1
  @Scene: add
  @Visibility: public |used in public const declare | used in public struct/class instance var
  @Object: enum
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
// ASSERT: scan-6 [API/ABI] Added enum deprecated annotation with compilation error.
// ASSERT: scan-3 [API/ABI] Added function deprecated annotation with compilation error.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-9 [API/ABI]

// test enum: add @Deprecated
package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
@Deprecated["deprecated", strict: true]
enum E11 {
    | E1
    public func g() {11}
}
@Deprecated["deprecated", strict: true]
enum E12 {
    | E2
    public func g() {12}
}
@Deprecated["deprecated", strict: true]
enum E13 {
    | E3
    public const func g() {13}
}
@Deprecated["deprecated", strict: true]
public enum E14 {
    | E4
    public func g() {14}
}
@Deprecated["deprecated", strict: true]
enum E21<T> {
    | E1(T)
    public func g() {21}
}
@Deprecated["deprecated", strict: true]
enum E22<T> {
    | E2(T)
    public func g() {22}
}
@Deprecated["deprecated", strict: true]
enum E23<T> {
    | E3(T)
    public const func g() {23}
}
@Deprecated["deprecated", strict: true]
public enum E24<T> {
    | E4(T)
    public func g() {24}
}
@Deprecated["deprecated", strict: true]
@Frozen
public func f1() {
    assert(E2.g(), 12)
    assert(E2(1).g(), 22)
}
@Deprecated["deprecated", strict: true]
public const func f2() {
    return E3.g() + E3(1).g()
}
@Deprecated["deprecated", strict: true]
public func check() {
    assert(E1.g(), 11)
    assert(E1(1).g(), 21)
}
