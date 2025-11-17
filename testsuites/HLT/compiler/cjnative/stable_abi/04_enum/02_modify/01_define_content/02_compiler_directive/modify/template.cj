/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n

package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
@Deprecated["deprecated", strict: false]
enum E11 {
    | E1
    public func g() {11}
}
@Deprecated["deprecated", strict: false]
enum E12 {
    | E2
    public func g() {12}
}
@Deprecated["deprecated", strict: false]
enum E13 {
    | E3
    public const func g() {13}
}
@Deprecated["deprecated", strict: false]
public enum E14 {
    | E4
    public func g() {14}
}
@Deprecated["deprecated", strict: false]
enum E21<T> {
    | E1(T)
    public func g() {21}
}
@Deprecated["deprecated", strict: false]
enum E22<T> {
    | E2(T)
    public func g() {22}
}
@Deprecated["deprecated", strict: false]
enum E23<T> {
    | E3(T)
    public const func g() {23}
}
@Deprecated["deprecated", strict: false]
public enum E24<T> {
    | E4(T)
    public func g() {24}
}
@Deprecated["deprecated", strict: true]
public enum E15 {
    | E5
    public func g() {15}
}
@Deprecated["deprecated", strict: true]
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
}
