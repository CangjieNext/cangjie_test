/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.2.2
  @Scene: delete
  @Visibility: public
  @Object: enum
  @Behavior: delete @Deprecated, strict: false
  @Expect: api compatible & abi compatible
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
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test enum: delete @Deprecated
package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
enum E11 {
    | E1
    public func g() {11}
}
enum E12 {
    | E2
    public func g() {12}
}
enum E13 {
    | E3
    public const func g() {13}
}
public enum E14 {
    | E4
    public func g() {14}
}
enum E21<T> {
    | E1(T)
    public func g() {21}
}
enum E22<T> {
    | E2(T)
    public func g() {22}
}
enum E23<T> {
    | E3(T)
    public const func g() {23}
}
public enum E24<T> {
    | E4(T)
    public func g() {24}
}
public enum E15 {
    | E5
    public func g() {15}
}
public enum E25<T> {
    | E5(T)
    public func g() {25}
}
@Frozen
public func f1() {
    assert(E2.g(), 12)
    assert(E2(1).g(), 22)
}
public const func f2() {
    return E3.g() + E3(1).g()
}
public func check() {
    assert(E1.g(), 11)
    assert(E1(1).g(), 21)
    assert(E5.g(), 15)
    assert(E5(1).g(), 25)
}
