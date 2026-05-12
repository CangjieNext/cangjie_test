/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n

package test_stable_abi

public enum E1 {
    | Red | Green | Blue(UInt8)
    public static func g() {1}
}
enum E2 {
    | Red | Green | Blue(UInt8)
    public static func g() {1}
}
public enum E3 {
    | Red | Green | Blue(UInt8)
    public static func g() {1}
}
public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public func check() {
    assert(E2.g(), 1)
}
