/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n

package test_stable_abi

public enum E11 {
    | Red | Green | Blue(UInt8)
    public func g() {1}
}
enum E12 {
    | Red | Green | Blue(UInt8)
    public func g() {1}
}
enum E13 {
    | Red | Green | Blue(UInt8)
    public func g() {1}
}
public class C1 {public let v = E12.Red.g()}
@Frozen public func f1() {E13.Blue(1).g()}
public enum E21 {
    | Red | Green | Blue | ...
    public func g() {1}
}
enum E22 {
    | Red | Green | Blue | ...
    public func g() {1}
}
enum E23 {
    | Red | Green | Blue | ...
    public func g() {1}
}
public class C2 {public let v = E22.Blue.g()}
@Frozen public func f2() {E23.Red.g()}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E12.Red.g(), 1)
    assert(E12.Green.g(), 1)
    assert(E12.Blue(1).g(), 1)
    assert(E13.Red.g(), 1)
    assert(E13.Green.g(), 1)
    assert(E13.Blue(1).g(), 1)
    assert(E22.Red.g(), 1)
    assert(E22.Green.g(), 1)
    assert(E22.Blue.g(), 1)
    assert(E23.Red.g(), 1)
    assert(E23.Green.g(), 1)
    assert(E23.Blue.g(), 1)
}
