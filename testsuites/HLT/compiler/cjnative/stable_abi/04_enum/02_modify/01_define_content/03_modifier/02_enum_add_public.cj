/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 4.2.1.3.2
  @Scene: add
  @Visibility: non public
  @Object: enum
  @Behavior: modifier: non public -> public
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


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// test enum: add access modifier: Invisible to Visible
package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public enum E11 {
    | E1
    public func g() {11}
}
private enum E12 {
    | E2
    public func g() {12}
}
internal enum E13 {
    | E3
    public func g() {13}
}
protected enum E14 {
    | E4
    public func g() {14}
}
public enum E15 {
    | E5
    public func g() {15}
}
public enum E21<T> {
    | E1(T)
    public func g() {21}
}
private enum E22<T> {
    | E2(T)
    public func g() {22}
}
internal enum E23<T> {
    | E3(T)
    public func g() {23}
}
protected enum E24<T> {
    | E4(T)
    public func g() {24}
}
public enum E25<T> {
    | E5(T)
    public func g() {25}
}
public func check() {
    assert(E1.g(), 11)
    assert(E2.g(), 12)
    assert(E3.g(), 13)
    assert(E4.g(), 14)
    assert(E1(1).g(), 21)
    assert(E2(1).g(), 22)
    assert(E3(1).g(), 23)
    assert(E4(1).g(), 24)
}
